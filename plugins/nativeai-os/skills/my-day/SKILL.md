---
name: my-day
description: Summarize the person's day from NativeAI OS (overdue work, replies to sort, demo pages opened, decisions nobody owns, calls and tasks this week). Use when they ask what is on today, what needs them, or "kaj imam danes".
---

Use the NativeAI OS tools, which act as the signed-in person.

1. Call `today`. If a call says the person must sign in, tell them to run `/mcp` and sign in to nativeai-os (in Codex: `codex mcp login nativeai-os`), then stop.
2. Answer in the person's language (usually Slovenian), dates as D. M., times as 24-hour Europe/Ljubljana:
   - what needs them now, most urgent first (overdue work, replies to sort, demo pages opened, decisions nobody owns, stopped data feeds);
   - calls and tasks due in the week ahead, in date order;
   - who on the team waits on them.
3. Name tasks by their title, never by id. Skip an empty section instead of saying it is empty, unless every section is empty. If `today` lists sources it could not read, say which in one line.

Change nothing unless the person asks; then use the matching tool (for example `complete_task` or `move_task_due_date`) and say what changed.
