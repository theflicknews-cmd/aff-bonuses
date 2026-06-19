# Deliverability Checklist

## One-time setup (do this first)

- [ ] Use a custom sending domain (not @gmail/@yahoo as the "from")
- [ ] Set up **SPF** record
- [ ] Set up **DKIM** signing
- [ ] Set up **DMARC** policy
- [ ] Verify your domain in your autoresponder
- [ ] Set a recognizable "from" name + reply-to you monitor
- [ ] Add a physical address + unsubscribe link to your template (often legally required)
- [ ] Enable double opt-in if available

## New domain/account warm-up

- [ ] Start with your most engaged subscribers
- [ ] Increase sending volume gradually over 2-4 weeks
- [ ] Keep early content valuable (high opens = fast reputation build)
- [ ] Ask a few early subscribers to reply (signals legitimacy)

## Per-send checklist (run before every broadcast)

**Subject + from**
- [ ] Subject is honest (no deceptive "RE:" tricks)
- [ ] No ALL CAPS, no excessive !!! or $$$
- [ ] Consistent "from" name

**Content**
- [ ] 1-2 links (not 10+)
- [ ] Healthy text-to-image ratio (don't send image-only emails)
- [ ] No spam-trigger overload ("free money", "guaranteed income", "act now!!!")
- [ ] No attachments
- [ ] Personalized where possible (name, segment)
- [ ] Clear, working unsubscribe link
- [ ] Mobile-friendly formatting

**Targeting**
- [ ] Sending to engaged/relevant segment (not the whole dead list)
- [ ] Suppressed hard-bounces and unsubscribes
- [ ] Good send time for the audience

## Monthly list hygiene

- [ ] Identify subscribers who haven't opened in 60-90 days
- [ ] Send a re-engagement email ("still want these?")
- [ ] Remove/suppress those who don't re-engage
- [ ] Review bounce + complaint rates
- [ ] Check open/click trend vs. last month

## Spam-trigger words to use sparingly

Free, guarantee, income, cash, $$$, act now, limited time, risk-free, winner, click
here, urgent, congratulations, 100%, make money. (A few are fine in context - it's
overuse + bad reputation that triggers filters.)

## Quick diagnosis

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| Sudden open-rate drop | Reputation/engagement | Prune non-openers, send value |
| New emails to spam | Auth missing/broken | Verify SPF/DKIM/DMARC |
| High complaints | List quality/expectations | Better opt-in, set expectations |
| Low opens always | Subject lines / from name | Test subjects (Product 17) |

---

*Authenticate, stay consistent, prioritize engagement, and keep the list clean. The
inbox is earned, not given.*
