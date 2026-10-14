---
name: company
description: Tell the person how NativeAI is doing from NativeAI OS (how we make money from first touch to paid work, the health tiles, and the decision to make first). Use when they ask how the company or the business is doing, about pipeline, or "kako gre podjetju".
---

1. Call `company_health`.
2. Answer in the person's language, in this order:
   - one line on where the company stands;
   - the flow from the three ways in (warm, outbound, content) to calls, deals and paid work, each step with its figure and the window it covers;
   - the health tiles that are failing or slipping, each with the reason the OS gives;
   - the decision to own first, from `decideFirst`.
3. Report figures exactly as the OS gives them. A figure marked not tracked or no records is said that way, never as 0. Deals at the IDEA stage are not pipeline.
4. Do not add numbers that are not in the result. For one growth system in depth, call `business_system` with warm, outbound or content.
