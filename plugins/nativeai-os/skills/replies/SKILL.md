---
name: replies
description: Go through outreach replies nobody has judged yet in NativeAI OS and sort them with the person. Use when they ask about replies, who answered, or to sort or triage replies ("odgovori").
---

1. Call `gtm_triage_queue`. If it is empty, say so in one line and stop.
2. For each reply, newest first: the company, what they wrote (short), the email they answered, and the classifier's suggestion.
3. Ask the person how to judge each one: interested, declined, do not contact, or not a real reply. Judge a reply with `gtm_reply_triage` only after they say so, then confirm in one line.
4. When the person says an interested lead should become a deal, call `gtm_move_to_pipeline`; it can be taken back with `gtm_move_to_pipeline_undo`.

Never write to or answer a prospect from here: sending email stays with the person in NativeAI OS at https://os.nativeai.agency/gtm/replies.
