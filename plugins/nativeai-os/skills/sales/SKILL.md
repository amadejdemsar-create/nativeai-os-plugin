---
name: sales
description: Answer how NativeAI sells, from outreach to implementation, using the team's sales process and the course lessons in NativeAI OS. Use when they ask how to run a discovery call, price an audit, write outreach, handle a proposal call or what the next sales step is ("prodaja", "kako prodajamo", "discovery klic").
---

1. Call `doc_read` with path `SOPs/sales-process.md`. It is the team's adopted flow and the source of truth, including prices and open decisions.
2. For depth on a step, call `academy_aaa` (without arguments it lists the courses and lessons; with `course` and `lesson` it returns that lesson's notes). Use the lesson the sales process cites for that step.
3. Answer in the person's language: the step, what to do and say, and the source (the sales process, or the course lesson by title). Where the course and a NativeAI decision differ, the NativeAI decision wins; say so.
4. Course material is paid and internal: summarize it, never paste lessons at length, and never put it into anything sent to a client or published.
5. If the question is about a specific lead or deal, read it with `pipeline_deals` or `gtm_lead` first and tie the answer to where that deal stands.
