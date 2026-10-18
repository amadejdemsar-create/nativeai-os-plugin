# nativeai-os plugin

Connects Claude Code or Codex to NativeAI OS at `https://os.nativeai.agency/api/mcp/mcp`, signed in as you, and adds seven shortcuts: `my-day` (what needs you today), `company` (how the company is doing), `replies` (sort outreach replies), `team-docs` (find, read and edit team documents), `sales` (the sales process and the course lessons behind it), `team-work` (tasks, assignments and logged time) and `team-expenses` (shared costs, balances and repayments).

Install:

```
/plugin install nativeai-os --marketplace amadejdemsar-create/nativeai-os-plugin
```

Then run `/mcp`, pick `plugin:nativeai-os:nativeai-os` and sign in with your NativeAI OS account. Codex and other agents: see the README at the root of this repository.

If NativeAI OS is already connected on claude.ai with the same Claude account, Claude Code sees it without this plugin; the plugin then only adds the shortcuts.
