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

# ---- Batch 4 ----
$PY "build/pdf/16-Beginner-Playbook.pdf" "The Beginner's Affiliate Marketing Playbook" \
    products/16-beginner-playbook/README.md products/16-beginner-playbook/quickstart.md

$PY "build/pdf/17-Headline-Swipe-File.pdf" "200 Headlines & Hooks Swipe File" \
    products/17-headline-swipe-file/README.md products/17-headline-swipe-file/headlines.md

$PY "build/pdf/18-Pinterest-Traffic.pdf" "Pinterest Traffic Playbook" \
    products/18-pinterest-traffic/README.md products/18-pinterest-traffic/pin-templates.md

$PY "build/pdf/19-AI-Automation-Guide.pdf" "AI Automation Guide for Affiliates" \
    products/19-ai-automation-guide/README.md products/19-ai-automation-guide/workflows.md

$PY "build/pdf/20-Offer-Selection-Kit.pdf" "Affiliate Offer Scorecard & Niche Selection Kit" \
    products/20-offer-selection-kit/README.md products/20-offer-selection-kit/scorecard.md

# ---- Batch 5 ----
$PY "build/pdf/21-YouTube-Growth-Kit.pdf" "YouTube Growth Kit for Affiliates" \
    products/21-youtube-growth-kit/README.md products/21-youtube-growth-kit/video-seo-checklist.md

$PY "build/pdf/22-Facebook-Group-Marketing.pdf" "Facebook Group & Community Marketing Playbook" \
    products/22-facebook-group-marketing/README.md products/22-facebook-group-marketing/engagement-templates.md

$PY "build/pdf/23-High-Ticket-Guide.pdf" "High-Ticket Affiliate Promotion Guide" \
    products/23-high-ticket-guide/README.md products/23-high-ticket-guide/objection-scripts.md

$PY "build/pdf/24-Metrics-Optimization.pdf" "Affiliate Metrics & Optimization Guide" \
    products/24-metrics-optimization/README.md products/24-metrics-optimization/tracking-template.md

$PY "build/pdf/25-Bonus-Stack-Strategy.pdf" "The Bonus Stack Strategy Guide" \
    products/25-bonus-stack-strategy/README.md products/25-bonus-stack-strategy/stack-planner.md

# ---- Batch 6 ----
$PY "build/pdf/26-Instagram-Playbook.pdf" "Instagram Affiliate Marketing Playbook" \
    products/26-instagram-playbook/README.md products/26-instagram-playbook/content-templates.md

$PY "build/pdf/27-DM-Outreach-Scripts.pdf" "DM & Outreach Script Pack" \
    products/27-dm-outreach-scripts/README.md products/27-dm-outreach-scripts/scripts.md

$PY "build/pdf/28-Compliance-Pack.pdf" "Affiliate Compliance & Disclosure Pack" \
    products/28-compliance-pack/README.md products/28-compliance-pack/templates.md

$PY "build/pdf/29-Launch-Planner.pdf" "Affiliate Launch & Promo Planner" \
    products/29-launch-planner/README.md products/29-launch-planner/launch-timeline.md

$PY "build/pdf/30-90-Day-Action-Plan.pdf" "The 90-Day Affiliate Action Plan" \
    products/30-90-day-action-plan/README.md products/30-90-day-action-plan/weekly-plan.md

# ---- Batch 7 ----
$PY "build/pdf/31-Blog-Content-Pack.pdf" "Affiliate Blog Content Pack" \
    products/31-blog-content-pack/README.md products/31-blog-content-pack/post-templates.md

$PY "build/pdf/32-AI-Image-Prompts.pdf" "AI Image & Thumbnail Prompt Pack" \
    products/32-ai-image-prompts/README.md products/32-ai-image-prompts/image-prompts.md

$PY "build/pdf/33-Niche-Database.pdf" "50 Profitable Affiliate Niches Database" \
    products/33-niche-database/README.md products/33-niche-database/niches.md

$PY "build/pdf/34-Copywriting-Formulas.pdf" "Copywriting Formulas Swipe Pack" \
    products/34-copywriting-formulas/README.md products/34-copywriting-formulas/formulas.md

$PY "build/pdf/35-Quiz-Funnel-Kit.pdf" "Quiz Funnel Kit" \
    products/35-quiz-funnel-kit/README.md products/35-quiz-funnel-kit/quiz-templates.md

# ---- Batch 8 ----
$PY "build/pdf/36-List-Growth-Guide.pdf" "Email List Growth Guide" \
    products/36-list-growth-guide/README.md products/36-list-growth-guide/tactics.md

$PY "build/pdf/37-Story-Email-Sequence.pdf" "Story-Based Email Sequence Pack" \
    products/37-story-email-sequence/README.md products/37-story-email-sequence/sequence.md

$PY "build/pdf/38-Personal-Brand-Guide.pdf" "Personal Brand & Authority Building Guide" \
    products/38-personal-brand-guide/README.md products/38-personal-brand-guide/positioning-worksheet.md

$PY "build/pdf/39-AI-Market-Research-Kit.pdf" "AI Market Research & Customer Avatar Kit" \
    products/39-ai-market-research-kit/README.md products/39-ai-market-research-kit/research-prompts.md

$PY "build/pdf/40-Glossary-QuickStart.pdf" "Affiliate Marketing Glossary & Quick-Reference" \
    products/40-glossary-quickstart/README.md products/40-glossary-quickstart/glossary.md

echo "Done. PDFs in build/pdf/:"
ls -la build/pdf/
