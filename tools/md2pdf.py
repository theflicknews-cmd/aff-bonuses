#!/usr/bin/env python3
"""Dependency-free Markdown -> PDF generator.

Produces clean, paginated PDFs using the standard PDF base-14 fonts
(Helvetica family + Courier). No external libraries required, so it works
in restricted environments.

Usage:
    python3 md2pdf.py OUT.pdf "Doc Title" in1.md [in2.md ...]
"""
import sys, re

# ---- Helvetica AFM widths (units/1000 em) for ASCII 32..126 ----
HELV = [278,278,355,556,556,889,667,191,333,333,389,584,278,333,278,278,
        556,556,556,556,556,556,556,556,556,556,278,278,584,584,584,556,
        1015,667,667,722,722,667,611,778,722,278,500,667,556,833,722,778,
        667,778,722,667,611,722,667,944,667,667,611,278,278,278,469,556,
        333,556,556,500,556,556,278,556,556,222,222,500,222,833,556,556,
        556,556,333,500,278,556,500,722,500,500,500,334,260,334,584]

def char_width(ch, fontkey, size):
    o = ord(ch)
    if fontkey == "C":            # Courier monospace
        return 600 * size / 1000.0
    if 32 <= o <= 126:
        w = HELV[o - 32]
    else:
        w = 556
    if fontkey == "B":            # bold ~ a touch wider; pad for safety
        w *= 1.06
    return w * size / 1000.0

def text_width(s, fontkey, size):
    return sum(char_width(c, fontkey, size) for c in s)

# ---- sanitize unicode -> safe ASCII (base-14 fonts can't render emoji) ----
REPL = {
    "’":"'", "‘":"'", "“":'"', "”":'"',
    "–":"-", "—":"-", "…":"...", "→":"->",
    "←":"<-", "•":"-", "·":"-", "✓":"[x]",
    "✅":"[+]", "❌":"[x]", "×":"x", "½":"1/2",
    "‘":"'", " ":" ",
}
def sanitize(s):
    for k, v in REPL.items():
        s = s.replace(k, v)
    # drop any remaining non-ASCII (emoji etc.)
    return "".join(c if 32 <= ord(c) <= 126 or c in "\n\t" else "" for c in s)

def pdf_escape(s):
    return s.replace("\\", r"\\").replace("(", r"\(").replace(")", r"\)")

# ---- page geometry ----
PW, PH = 612.0, 792.0
ML, MR, MT, MB = 60.0, 60.0, 66.0, 60.0
CW = PW - ML - MR
SAFE = 0.97

class PDF:
    def __init__(self):
        self.pages = []      # each page = list of content ops (strings)
        self.cur = None
        self.y = 0
        self.new_page()

    def new_page(self):
        self.cur = []
        self.pages.append(self.cur)
        self.y = PH - MT

    def space(self, h):
        if self.y - h < MB:
            self.new_page()
        else:
            self.y -= h

    def ensure(self, h):
        if self.y - h < MB:
            self.new_page()

    def draw_runs(self, runs, size, leading, indent=0.0, color=None):
        """runs: list of (text, fontkey). Wraps across lines."""
        x0 = ML + indent
        avail = (CW - indent) * SAFE
        # tokenize into (word, fontkey) keeping spaces as separators
        words = []
        for text, fk in runs:
            parts = re.split(r"(\s+)", text)
            for p in parts:
                if p == "":
                    continue
                words.append((p, fk))
        line = []
        line_w = 0.0
        def flush(last=False):
            nonlocal line, line_w
            if not line:
                self.space(leading); return
            self.ensure(leading)
            self.y -= leading
            ops = []
            x = x0
            for w, fk in line:
                if w.strip() == "" and x == x0:
                    continue
                ww = text_width(w, fk, size)
                ops.append("BT /F%s %.2f Tf 1 0 0 1 %.2f %.2f Tm" % (fk, size, x, self.y))
                if color:
                    ops.append("%.3f %.3f %.3f rg" % color)
                ops.append("(%s) Tj ET" % pdf_escape(w))
                if color:
                    ops.append("0 0 0 rg")
                x += ww
            self.cur.extend(ops)
            line = []; line_w = 0.0
        for w, fk in words:
            ww = text_width(w, fk, size)
            is_space = (w.strip() == "")
            if line_w + ww > avail and not is_space and line:
                flush()
            if is_space and not line:
                continue
            line.append((w, fk)); line_w += ww
        flush(True)

    def hr(self):
        self.space(8)
        self.ensure(2)
        self.cur.append("0.7 0.7 0.7 RG 0.8 w %.2f %.2f m %.2f %.2f l S" %
                        (ML, self.y, PW - MR, self.y))
        self.space(8)

    def render(self):
        objs = []
        def add(o): objs.append(o); return len(objs)
        # font objects
        fonts = {
            "R": "/Helvetica", "B": "/Helvetica-Bold",
            "I": "/Helvetica-Oblique", "C": "/Courier",
        }
        font_ids = {}
        for k, base in fonts.items():
            fid = add("<< /Type /Font /Subtype /Type1 /BaseFont %s "
                      "/Encoding /WinAnsiEncoding >>" % base)
            font_ids[k] = fid
        res = ("<< /Font << " +
               " ".join("/F%s %d 0 R" % (k, font_ids[k]) for k in fonts) +
               " >> >>")
        page_obj_ids = []
        content_ids = []
        for ops in self.pages:
            stream = "\n".join(ops)
            cid = add(("<< /Length %d >>\nstream\n%s\nendstream"
                       % (len(stream.encode("latin-1", "replace")), stream)))
            content_ids.append(cid)
        pages_id_placeholder = len(objs) + len(self.pages) + 1
        for i, ops in enumerate(self.pages):
            pid = add("<< /Type /Page /Parent %d 0 R /MediaBox [0 0 %.0f %.0f] "
                      "/Resources %s /Contents %d 0 R >>"
                      % (pages_id_placeholder, PW, PH, res, content_ids[i]))
            page_obj_ids.append(pid)
        pages_id = add("<< /Type /Pages /Kids [%s] /Count %d >>"
                       % (" ".join("%d 0 R" % p for p in page_obj_ids),
                          len(page_obj_ids)))
        assert pages_id == pages_id_placeholder, (pages_id, pages_id_placeholder)
        catalog_id = add("<< /Type /Catalog /Pages %d 0 R >>" % pages_id)
        # serialize
        out = ["%PDF-1.4"]
        offsets = [0]
        pos = len(out[0]) + 1
        body = out[0] + "\n"
        for i, o in enumerate(objs, 1):
            offsets.append(len(body.encode("latin-1", "replace")))
            body += "%d 0 obj\n%s\nendobj\n" % (i, o)
        xref_pos = len(body.encode("latin-1", "replace"))
        body += "xref\n0 %d\n" % (len(objs) + 1)
        body += "0000000000 65535 f \n"
        for off in offsets[1:]:
            body += "%010d 00000 n \n" % off
        body += ("trailer\n<< /Size %d /Root %d 0 R >>\nstartxref\n%d\n%%%%EOF\n"
                 % (len(objs) + 1, catalog_id, xref_pos))
        return body.encode("latin-1", "replace")

# ---- inline markdown -> runs ----
def parse_inline(text, base="R"):
    text = sanitize(text)
    runs = []
    i = 0
    tokens = re.split(r"(\*\*.+?\*\*|`[^`]+`|\*[^*]+?\*)", text)
    for t in tokens:
        if not t:
            continue
        if t.startswith("**") and t.endswith("**") and len(t) > 4:
            runs.append((t[2:-2], "B"))
        elif t.startswith("`") and t.endswith("`") and len(t) > 2:
            runs.append((t[1:-1], "C"))
        elif t.startswith("*") and t.endswith("*") and len(t) > 2:
            runs.append((t[1:-1], "I"))
        else:
            runs.append((t, base))
    return runs or [("", base)]

def convert(md_files, out_path, title):
    pdf = PDF()
    # title block
    pdf.space(10)
    pdf.draw_runs([(sanitize(title), "B")], 24, 28)
    pdf.hr()
    for path in md_files:
        with open(path, encoding="utf-8") as f:
            lines = f.read().split("\n")
        in_code = False
        code_buf = []
        i = 0
        while i < len(lines):
            raw = lines[i]
            line = raw.rstrip("\n")
            stripped = line.strip()
            # code fence
            if stripped.startswith("```"):
                if in_code:
                    for cl in code_buf:
                        pdf.draw_runs([(sanitize(cl) or " ", "C")], 9, 12.5, indent=10)
                    code_buf = []; in_code = False
                    pdf.space(4)
                else:
                    in_code = True
                    pdf.space(4)
                i += 1; continue
            if in_code:
                code_buf.append(line); i += 1; continue
            # blank
            if stripped == "":
                pdf.space(6); i += 1; continue
            # hr
            if re.fullmatch(r"-{3,}|\*{3,}|_{3,}", stripped):
                pdf.hr(); i += 1; continue
            # headings
            m = re.match(r"^(#{1,6})\s+(.*)$", stripped)
            if m:
                level = len(m.group(1)); txt = m.group(2)
                size = {1:20,2:15.5,3:12.5}.get(level, 11.5)
                pdf.space(12 if level<=2 else 9)
                pdf.draw_runs(parse_inline(txt, "B"), size, size*1.3)
                pdf.space(3)
                i += 1; continue
            # table block
            if stripped.startswith("|") and "|" in stripped[1:]:
                tbl = []
                while i < len(lines) and lines[i].strip().startswith("|"):
                    tbl.append(lines[i].strip()); i += 1
                render_table(pdf, tbl); continue
            # blockquote
            if stripped.startswith(">"):
                txt = stripped.lstrip(">").strip()
                pdf.draw_runs(parse_inline(txt, "I"), 10.5, 14.5, indent=18)
                i += 1; continue
            # list items
            m = re.match(r"^(\s*)([-*+]|\d+[.)])\s+(.*)$", line)
            if m:
                lead = len(m.group(1))
                marker = m.group(2)
                txt = m.group(3)
                indent = 14 + (lead // 2) * 12
                # checkbox
                cb = re.match(r"^\[([ xX])\]\s+(.*)$", txt)
                if cb:
                    box = "[x]" if cb.group(1).lower() == "x" else "[ ]"
                    bullet = box + " "
                    txt = cb.group(2)
                elif re.match(r"\d+[.)]", marker):
                    bullet = marker + " "
                else:
                    bullet = "- "
                runs = [(bullet, "R")] + parse_inline(txt, "R")
                pdf.draw_runs(runs, 10.5, 14.5, indent=indent)
                i += 1; continue
            # paragraph
            pdf.draw_runs(parse_inline(line, "R"), 10.5, 15)
            i += 1
        pdf.space(10)
    with open(out_path, "wb") as f:
        f.write(pdf.render())

def render_table(pdf, rows):
    cells = []
    for r in rows:
        parts = [c.strip() for c in r.strip().strip("|").split("|")]
        cells.append(parts)
    # drop separator rows (---)
    cells = [c for c in cells if not all(re.fullmatch(r":?-{2,}:?", x or "-") for x in c)]
    if not cells:
        return
    ncol = max(len(c) for c in cells)
    colw = (CW * SAFE) / ncol
    pdf.space(4)
    for ri, row in enumerate(cells):
        fk = "B" if ri == 0 else "R"
        size = 9.0
        # wrap each cell, compute row height
        wrapped = []
        maxlines = 1
        for ci in range(ncol):
            cell = sanitize(row[ci]) if ci < len(row) else ""
            ws = wrap_plain(cell, fk, size, colw - 6)
            wrapped.append(ws); maxlines = max(maxlines, len(ws))
        rh = maxlines * 11 + 4
        pdf.ensure(rh)
        ytop = pdf.y
        for ci in range(ncol):
            x = ML + ci * colw + 3
            yy = ytop - 10
            for wl in wrapped[ci]:
                pdf.cur.append("BT /F%s %.2f Tf 1 0 0 1 %.2f %.2f Tm (%s) Tj ET"
                               % (fk, size, x, yy, pdf_escape(wl)))
                yy -= 11
        pdf.y = ytop - rh
        pdf.cur.append("0.8 0.8 0.8 RG 0.6 w %.2f %.2f m %.2f %.2f l S"
                       % (ML, pdf.y, PW - MR, pdf.y))
    pdf.space(6)

def wrap_plain(text, fk, size, maxw):
    words = text.split()
    if not words:
        return [""]
    lines = []; cur = ""
    for w in words:
        trial = (cur + " " + w).strip()
        if text_width(trial, fk, size) > maxw and cur:
            lines.append(cur); cur = w
        else:
            cur = trial
    if cur:
        lines.append(cur)
    return lines

if __name__ == "__main__":
    out = sys.argv[1]; title = sys.argv[2]; ins = sys.argv[3:]
    convert(ins, out, title)
    print("wrote", out)
