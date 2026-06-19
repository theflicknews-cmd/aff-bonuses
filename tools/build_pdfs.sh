#!/usr/bin/env bash
# Build one clean PDF per product into build/pdf/.
set -e
cd "$(dirname "$0")/.."
mkdir -p build/pdf
PY="python3 tools/md2pdf.py"

$PY "build/pdf/00-Bonus-Vault-Catalog.pdf" "Affiliate Bonus Vault - Catalog" \
    README.md

$PY "build/pdf/01-AI-Prompt-Vault.pdf" "AI Prompt Vault for Affiliate Marketers" \
    products/01-ai-prompt-vault/README.md products/01-ai-prompt-vault/prompts-full.md

$PY "build/pdf/02-Bonus-Page-Kit.pdf" "High-Converting Bonus Page Kit" \
    products/02-bonus-page-kit/README.md products/02-bonus-page-kit/swipe-copy.md

$PY "build/pdf/03-Social-Content-Calendar.pdf" "30-Day Social Media Content Calendar" \
    products/03-social-content-calendar/README.md \
    products/03-social-content-calendar/calendar.md \
    products/03-social-content-calendar/caption-templates.md

$PY "build/pdf/04-Email-Swipe-File.pdf" "Affiliate Promo Email Swipe File" \
    products/04-email-swipe-file/README.md products/04-email-swipe-file/emails.md

$PY "build/pdf/05-Affiliate-Profit-Checklists.pdf" "The Affiliate Profit Checklist Pack" \
    products/05-affiliate-profit-checklists/README.md \
    products/05-affiliate-profit-checklists/checklists.md

# ---- Batch 2 ----
$PY "build/pdf/06-Lead-Magnet-Kit.pdf" "Lead Magnet Creation Kit" \
    products/06-lead-magnet-kit/README.md products/06-lead-magnet-kit/optin-copy.md

$PY "build/pdf/07-Video-Script-Pack.pdf" "VSL & Video Script Pack" \
    products/07-video-script-pack/README.md products/07-video-script-pack/scripts.md

$PY "build/pdf/08-AI-Repurposing-System.pdf" "AI Content Repurposing System" \
    products/08-ai-repurposing-system/README.md products/08-ai-repurposing-system/prompts.md

$PY "build/pdf/09-Free-Traffic-Playbook.pdf" "Free Traffic Playbook" \
    products/09-free-traffic-playbook/README.md \
    products/09-free-traffic-playbook/30-day-traffic-plan.md

$PY "build/pdf/10-Funnel-Templates.pdf" "Done-For-You Sales Funnel Templates" \
    products/10-funnel-templates/README.md products/10-funnel-templates/page-copy.md

# ---- Batch 3 ----
$PY "build/pdf/11-Review-Site-Blueprint.pdf" "Affiliate Review Site Blueprint" \
    products/11-review-site-blueprint/README.md products/11-review-site-blueprint/page-templates.md

$PY "build/pdf/12-Webinar-Deck.pdf" "Webinar Slide Deck Template" \
    products/12-webinar-deck/README.md products/12-webinar-deck/slides.md

$PY "build/pdf/13-Paid-Ads-Swipes.pdf" "Paid Ads Swipe File" \
    products/13-paid-ads-swipes/README.md products/13-paid-ads-swipes/ad-swipes.md

$PY "build/pdf/14-AI-Tools-Directory.pdf" "AI Tools Directory for Affiliates" \
    products/14-ai-tools-directory/README.md products/14-ai-tools-directory/promo-angles.md

$PY "build/pdf/15-TikTok-Reels-Growth.pdf" "TikTok & Reels Growth Playbook" \
    products/15-tiktok-reels-growth/README.md products/15-tiktok-reels-growth/hook-bank.md

echo "Done. PDFs in build/pdf/:"
ls -la build/pdf/
