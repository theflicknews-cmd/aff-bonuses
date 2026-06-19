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

echo "Done. PDFs in build/pdf/:"
ls -la build/pdf/
