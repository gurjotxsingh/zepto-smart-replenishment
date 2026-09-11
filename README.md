# Smart Replenishment for Quick Commerce

### A product analytics case study on improving repeat purchase retention through smarter replenishment.

[📄 View Consulting Report](04_Consulting_Report/Zepto_Smart_Replenishment_Report.pdf) · [🧠 Product Logic](05_Product/Smart_Replenishment_Product_Logic.pdf) · [💻 Prototype](05_Product/Prototype/index.html)

---

## The Problem

Quick-commerce users repeatedly purchase everyday essentials, but rebuilding the same basket still requires users to remember what they bought, search for it again, and manually recreate the order.

This creates an opportunity to make repeat purchasing more effortless — without taking control away from the user.

The question I explored was:

> **Can Zepto use users' recurring purchase behaviour to proactively prepare replenishment baskets and make repeat ordering easier?**

---

## My Approach

Rather than jumping directly to a product solution, I followed a research → validation → product development approach:

**User Research → Hypotheses → Quantitative Validation → Strategic Synthesis → Product Decision → Product Logic → Prototype → Experimentation**

The project combines qualitative user research with SQL-based behavioural analysis and product thinking.

---

## What I Analyzed

### Dataset

The analysis uses synthetically generated data representing:

| Dataset | Records | Purpose |
|---|---:|---|
| Orders | 80,000 | Purchase behaviour, order value, delivery time and coupon usage |
| Sessions | 50,000 | Search, cart, checkout and order behaviour |
| Users | 10,000 | User attributes and churn status |
| Subscriptions | 10,000 | Membership information |

### User Research

I personally conducted **18 qualitative user interviews** to understand recurring purchase behaviour, friction points and potential reasons behind churn.

The interviews surfaced recurring themes around:

- Trust & reliability
- Inventory availability
- Price & value
- Recurring purchases and reorder friction

These themes were converted into hypotheses rather than being treated as proven churn drivers.

### Quantitative Analysis

For quantitative validation, I used **synthetically generated data with AI assistance**, representing:

- 80,000 orders
- 50,000 sessions
- 10,000 users
- 10,000 subscription records

I then analyzed this data using SQL to test the hypotheses generated from the user research.

---

# From Research to Evidence

I tested five hypotheses using the available behavioural data.

| Hypothesis | What I tested | Result |
|---|---|---|
| **H1 — Trust & Reliability** | Delivery behaviour vs retention | Not supported by available data |
| **H2 — Inventory** | Search/cart behaviour vs retention | Not validated |
| **H3 — Price & Value** | Coupon behaviour vs retention | Partially supported |
| **H4 — Habit Formation** | Recurring purchase patterns | Recurring behaviour observed, but not a churn differentiator |
| **H5 — Membership** | Premium vs Free retention | Strongest observed association |

### Key findings

**1. Membership showed the strongest observed retention association.**

Premium users had a **15.34% churn rate**, compared with **40.41% among Free users**.

This is an association, not evidence that membership causes retention.

**2. Coupon behaviour did not meaningfully explain churn.**

Coupon users were generally more active, but higher coupon dependency did not translate into a meaningful churn difference.

**3. Recurring purchasing behaviour clearly exists.**

Users repeatedly purchase everyday categories, creating a natural opportunity for replenishment assistance.

However, recurring purchasing itself did not meaningfully differentiate churn in the available data.

**4. Some hypotheses could not be directly validated.**

The dataset did not contain direct service-failure or stock-out events. Therefore, I did not treat those hypotheses as disproved.

---

# Product Opportunity

The analysis led to a more specific product opportunity:

> **Help users repeat predictable purchases with less effort by detecting recurring behaviour and preparing a reorder basket at the right time.**

This became **Smart Replenishment**.

The target user is a **Routine Rebuyer** — a user who repeatedly purchases the same products or categories with a sufficiently predictable purchasing pattern.

---

# Smart Replenishment

The proposed experience follows a simple loop:

**Purchase → Detect → Prepare → Review → Reorder → Learn**

### How it works

The MVP evaluates four signals:

1. **Repeat behaviour**  
   Has the user purchased the same product or category multiple times?

2. **Purchase interval**  
   How much time typically passes between purchases?

3. **Consistency**  
   Are those purchase intervals reasonably predictable?

4. **Recency / due window**  
   Is the user approaching the expected replenishment window?

Only when the behaviour is sufficiently repeated, predictable and approaching its expected window does the system surface a replenishment recommendation.

---

# Product Principles

### User stays in control

Smart Replenishment prepares the basket — it does **not** automatically place the order.

Users can:

- Remove an item
- Change quantity
- Add something else
- Ignore the recommendation

### Explainable recommendations

Users can see **why** an item was recommended:

- How many times they bought it
- Their typical purchase interval
- When they last purchased it
- Whether the behaviour appears predictable
- Whether it is currently due

### Don't over-recommend

The system should not recommend:

- Items bought only once
- Highly irregular purchases
- Items purchased very recently
- Unavailable products

The exact thresholds for eligibility should be determined through historical-data testing and experimentation rather than arbitrarily fixed in the MVP.

---

# Prototype

A functional front-end prototype was built to demonstrate the proposed experience.

The prototype includes:

- Smart Replenishment entry point
- Your Usuals
- Replenishment recommendations
- Recommendation explanations
- Pre-filled reorder basket
- Review & Edit flow
- Order confirmation
- Buy Again and other normal commerce context

The prototype uses **precomputed outputs from the analysis** to demonstrate the product experience. It does not dynamically execute the raw CSV analysis in the browser.

### Screenshots

![Smart Replenishment Home](06_Assets/screenshots/01_Home_Smart_Replenishment.png)

![Your Usuals](06_Assets/screenshots/02_Your_Usuals.png)

![Why This Recommendation](06_Assets/screenshots/03_Why_Recommendation.png)

![Review Order](06_Assets/screenshots/04_Review_Order.png)

![Order Confirmation](06_Assets/screenshots/05_Order_Confirmation.png)

---

# Experimentation

The product should be validated through controlled experimentation rather than assuming that easier reordering automatically improves retention.

### Primary metric

**Repeat Order Rate**

Measure whether users exposed to Smart Replenishment place more repeat orders than a control group.

### Supporting metrics

- Replenishment recommendation acceptance rate
- Reorder conversion rate
- Time from recommendation to order
- Average orders per user
- Basket value
- Recommendation removal rate
- Recommendation ignore rate

### Guardrails

- Cancellation rate
- Refund / issue rate
- User complaints
- Negative recommendation feedback

The initial experiment would compare users receiving Smart Replenishment against a control experience without the feature.

---

# Limitations

This project has several important limitations:

- The datasets are synthetically generated.
- The current order data is category-level rather than SKU-level.
- There is no direct stock-out / inventory availability event data.
- There is no direct record of wrong, damaged or failed orders.
- Therefore, some qualitative hypotheses could not be directly validated.
- The prototype demonstrates precomputed analytical outputs rather than a production recommendation engine.
- SKU-level replenishment would require item-level purchase and quantity data.

These limitations define what would need to be validated before production deployment.

---

# Repository Structure
```text

zepto-smart-replenishment/
│
├── 01_User_Research/
│   └── User_Research_and_Validation.xlsx
│
├── 02_Dataset/
│   ├── orders.csv
│   ├── sessions.csv
│   ├── subscriptions.csv
│   └── users.csv
│
├── 03_SQL_Analysis/
│   ├── H1_Trust_Reliability.sql
│   ├── H2_Inventory.sql
│   ├── H3_Price_Value.sql
│   ├── H4_Habit_Formation.sql
│   ├── H5_Membership_Loyalty.sql
│   └── sessions.sql
│
├── 04_Consulting_Report/
│   └── Zepto_Smart_Replenishment_Report.pdf
│
├── 05_Product/
│   ├── Smart_Replenishment_Product_Logic.pdf
│   └── prototype/
│       └── index.html
│
└── 06_Assets/
    └── screenshots/
```

# Tools

**User Research** · Excel  
**Data Analysis** · SQL  
**Product Strategy** · Hypothesis Testing · Prioritization · Experimentation  
**Prototype** · HTML · CSS · JavaScript  
**Documentation** · Canva

---

# Disclaimer

This is an independent academic/product case study using synthetically generated data with AI assistance for the quantitative analysis.

The **18 qualitative user interviews were personally conducted by me**.

This project is **not affiliated with, sponsored by, or based on internal data from Zepto**.
