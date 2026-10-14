---
name: team-docs
description: Find, read or edit a NativeAI team document (strategy, offer, priorities, decisions, research) through NativeAI OS. Use when they ask what the team docs say about something, or to update a document ("poglej v Docs", "zapiši v Docs").
---

1. Call `docs_tree` to find the document by title, folder or summary. Read it with `doc_read`.
2. Answer from the document and name it by its title. Do not add facts that are not in it.
3. To change a document: read it with `doc_read` right before, show the person the change, and save with `doc_update` passing the `sha` from that read, once they agree. The edit becomes a commit in the team docs repository signed as them.
4. If `doc_update` reports that the document changed, read it again, apply the change to the new text and save once more. Never paste over a newer version.

Follow the team docs' own rules: English, no dashes as punctuation, one topic per document, update the owner document instead of making a new one.
