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

# ---- Batch 9 (advanced / scaling) ----
$PY "build/pdf/41-Recurring-SaaS-System.pdf" "Recurring & SaaS Affiliate Income System" \
    products/41-recurring-saas-system/README.md products/41-recurring-saas-system/recurring-tracker.md

$PY "build/pdf/42-Email-Deliverability.pdf" "Email Deliverability & Inbox Mastery Guide" \
    products/42-email-deliverability/README.md products/42-email-deliverability/deliverability-checklist.md

$PY "build/pdf/43-Outsourcing-Scaling.pdf" "Outsourcing & Scaling Playbook" \
    products/43-outsourcing-scaling/README.md products/43-outsourcing-scaling/delegation-templates.md

$PY "build/pdf/44-Seasonal-Promo-Pack.pdf" "Seasonal & Holiday Promo Swipe Pack" \
    products/44-seasonal-promo-pack/README.md products/44-seasonal-promo-pack/seasonal-swipes.md

$PY "build/pdf/45-Affiliate-SOP-Toolkit.pdf" "Affiliate SOP & Systems Toolkit" \
    products/45-affiliate-sop-toolkit/README.md products/45-affiliate-sop-toolkit/sops.md

# ---- Batch 10 (new channels & mechanisms) ----
$PY "build/pdf/46-Challenge-Launch-Kit.pdf" "5-Day Challenge Launch Kit" \
    products/46-challenge-launch-kit/README.md products/46-challenge-launch-kit/challenge-scripts.md

$PY "build/pdf/47-Podcast-Audio-Marketing.pdf" "Podcast & Audio Marketing Guide" \
    products/47-podcast-audio-marketing/README.md products/47-podcast-audio-marketing/episode-templates.md

$PY "build/pdf/48-Custom-GPT-Builder.pdf" "Custom GPT & AI Assistant Builder Guide" \
    products/48-custom-gpt-builder/README.md products/48-custom-gpt-builder/assistant-instructions.md

$PY "build/pdf/49-Giveaway-Viral-Kit.pdf" "Giveaway & Viral Referral Kit" \
    products/49-giveaway-viral-kit/README.md products/49-giveaway-viral-kit/giveaway-templates.md

$PY "build/pdf/50-X-Twitter-Growth.pdf" "X (Twitter) Growth & Threads Playbook" \
    products/50-x-twitter-growth/README.md products/50-x-twitter-growth/thread-templates.md

# ---- Batch 11 (more channels & models) ----
$PY "build/pdf/51-LinkedIn-Playbook.pdf" "LinkedIn Affiliate Marketing Playbook" \
    products/51-linkedin-playbook/README.md products/51-linkedin-playbook/post-templates.md

$PY "build/pdf/52-Backend-LTV-System.pdf" "Backend & Buyer LTV Profit System" \
    products/52-backend-ltv-system/README.md products/52-backend-ltv-system/ltv-playbook.md

$PY "build/pdf/53-Faceless-AI-Video.pdf" "Faceless AI Video Channel Blueprint" \
    products/53-faceless-ai-video/README.md products/53-faceless-ai-video/production-pipeline.md

$PY "build/pdf/54-Newsletter-Monetization.pdf" "Affiliate Newsletter Monetization System" \
    products/54-newsletter-monetization/README.md products/54-newsletter-monetization/issue-templates.md

$PY "build/pdf/55-Deal-Comparison-Site.pdf" "Deal & Comparison Site Model" \
    products/55-deal-comparison-site/README.md products/55-deal-comparison-site/page-structures.md

# ---- Batch 12 (niche promo bundles - done-for-you) ----
$PY "build/pdf/56-AI-Tools-Bundle.pdf" "AI Tools / Software Promo Bundle" \
    bundles/56-ai-tools-bundle/README.md bundles/56-ai-tools-bundle/swipes.md

$PY "build/pdf/57-Make-Money-Online-Bundle.pdf" "Make Money Online / Affiliate Promo Bundle" \
    bundles/57-make-money-online-bundle/README.md bundles/57-make-money-online-bundle/swipes.md

$PY "build/pdf/58-Email-List-Building-Bundle.pdf" "Email / List-Building Promo Bundle" \
    bundles/58-email-list-building-bundle/README.md bundles/58-email-list-building-bundle/swipes.md

$PY "build/pdf/59-Traffic-Social-Bundle.pdf" "Traffic & Social Media Growth Promo Bundle" \
    bundles/59-traffic-social-bundle/README.md bundles/59-traffic-social-bundle/swipes.md

$PY "build/pdf/60-Weight-Loss-Fitness-Bundle.pdf" "Weight Loss / Fitness Promo Bundle" \
    bundles/60-weight-loss-fitness-bundle/README.md bundles/60-weight-loss-fitness-bundle/swipes.md

# ---- Batch 13 (more niche promo bundles) ----
$PY "build/pdf/61-Video-Tools-Bundle.pdf" "Video Creation & Editing Tools Promo Bundle" \
    bundles/61-video-tools-bundle/README.md bundles/61-video-tools-bundle/swipes.md

$PY "build/pdf/62-Funnel-Builder-Bundle.pdf" "Funnel & Website Builder Promo Bundle" \
    bundles/62-funnel-builder-bundle/README.md bundles/62-funnel-builder-bundle/swipes.md

$PY "build/pdf/63-Ecommerce-Dropshipping-Bundle.pdf" "eCommerce / Dropshipping Promo Bundle" \
    bundles/63-ecommerce-dropshipping-bundle/README.md bundles/63-ecommerce-dropshipping-bundle/swipes.md

$PY "build/pdf/64-Personal-Finance-Bundle.pdf" "Personal Finance / Investing Promo Bundle" \
    bundles/64-personal-finance-bundle/README.md bundles/64-personal-finance-bundle/swipes.md

$PY "build/pdf/65-Self-Improvement-Bundle.pdf" "Self-Improvement / Productivity Promo Bundle" \
    bundles/65-self-improvement-bundle/README.md bundles/65-self-improvement-bundle/swipes.md

# ---- Batch 14 (more niche promo bundles) ----
$PY "build/pdf/66-SEO-Content-Bundle.pdf" "SEO & Content Marketing Tools Promo Bundle" \
    bundles/66-seo-content-bundle/README.md bundles/66-seo-content-bundle/swipes.md

$PY "build/pdf/67-Coaching-Course-Bundle.pdf" "Coaching & Course Creator Tools Promo Bundle" \
    bundles/67-coaching-course-bundle/README.md bundles/67-coaching-course-bundle/swipes.md

$PY "build/pdf/68-Crypto-Web3-Bundle.pdf" "Crypto & Web3 Promo Bundle" \
    bundles/68-crypto-web3-bundle/README.md bundles/68-crypto-web3-bundle/swipes.md

$PY "build/pdf/69-Dating-Relationships-Bundle.pdf" "Dating & Relationships Promo Bundle" \
    bundles/69-dating-relationships-bundle/README.md bundles/69-dating-relationships-bundle/swipes.md

$PY "build/pdf/70-Survival-Preparedness-Bundle.pdf" "Survival & Preparedness Promo Bundle" \
    bundles/70-survival-preparedness-bundle/README.md bundles/70-survival-preparedness-bundle/swipes.md

# ---- Batch 15 (more niche promo bundles) ----
$PY "build/pdf/71-Pets-Dog-Training-Bundle.pdf" "Pets / Dog Training Promo Bundle" \
    bundles/71-pets-dog-training-bundle/README.md bundles/71-pets-dog-training-bundle/swipes.md

$PY "build/pdf/72-Gaming-Bundle.pdf" "Gaming Promo Bundle" \
    bundles/72-gaming-bundle/README.md bundles/72-gaming-bundle/swipes.md

$PY "build/pdf/73-Cooking-Recipes-Bundle.pdf" "Cooking / Recipes Promo Bundle" \
    bundles/73-cooking-recipes-bundle/README.md bundles/73-cooking-recipes-bundle/swipes.md

$PY "build/pdf/74-Travel-Bundle.pdf" "Travel Promo Bundle" \
    bundles/74-travel-bundle/README.md bundles/74-travel-bundle/swipes.md

$PY "build/pdf/75-Parenting-Bundle.pdf" "Parenting / Family Promo Bundle" \
    bundles/75-parenting-bundle/README.md bundles/75-parenting-bundle/swipes.md

echo "Done. PDFs in build/pdf/:"
ls -la build/pdf/
