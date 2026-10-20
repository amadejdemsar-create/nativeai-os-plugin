# NativeAI OS for Claude Code and Codex

The `nativeai-os` plugin connects Claude Code or Codex to NativeAI OS (`https://os.nativeai.agency/api/mcp/mcp`), signed in as you with your NativeAI OS account, and adds seven shortcuts: `my-day`, `company`, `replies`, `team-docs`, `sales`, `team-work` and `team-expenses`.

## Claude Code

In a terminal:

```
claude plugin marketplace add amadejdemsar-create/nativeai-os-plugin
claude plugin install nativeai-os@nativeai
```

Then run `/mcp` in Claude Code, pick `plugin:nativeai-os:nativeai-os` and sign in. Only people with a NativeAI OS account can sign in; the plugin holds no credentials. The shortcuts are `/nativeai-os:my-day`, `/nativeai-os:company`, `/nativeai-os:replies`, `/nativeai-os:team-docs`, `/nativeai-os:sales`, `/nativeai-os:team-work` and `/nativeai-os:team-expenses`.

If NativeAI OS is already connected in Claude Code (`claude mcp add`) or on claude.ai with the same Claude account, Claude Code keeps that connection and skips the plugin's copy of the same server; the plugin then only adds the shortcuts.

## Codex

```
codex plugin marketplace add amadejdemsar-create/nativeai-os-plugin
codex plugin add nativeai-os@nativeai
codex mcp login nativeai-os
```

The same skills and the same NativeAI OS server load in the Codex CLI, the IDE extension and the ChatGPT desktop app. The plugin list shows only the seven skills; the NativeAI OS tools come from the server once you are signed in: the daily ones are listed, the rest are reached with `find_tools` and `call_tool` (see below).

## Agents without plugins

Hermes Agent, Grok Bot and any other client that supports remote MCP with OAuth connect straight to `https://os.nativeai.agency/api/mcp/mcp` (Streamable HTTP, OAuth, no key).

Hermes Agent, in `~/.hermes/config.yaml`, then `hermes mcp login nativeai-os`:

```yaml
mcp_servers:
  nativeai-os:
    url: "https://os.nativeai.agency/api/mcp/mcp"
    auth: oauth
```

Without a plugin in a terminal: `claude mcp add --transport http nativeai-os https://os.nativeai.agency/api/mcp/mcp` or `codex mcp add nativeai-os --url https://os.nativeai.agency/api/mcp/mcp`.

## What stays with you

## How the tools are listed

The server lists a small set of daily tools (today, company_health, my_tasks, get_task, create_task, update_task, complete_task, list_projects, get_project, list_users, pipeline_deals, crm_opportunity, workspaces, team_tasks, expenses, docs_tree, doc_read) plus four that reach the rest: `find_tools` searches every tool and returns its exact name, its schema and `run_with`, the runner to use. `call_read_tool` runs tools that only read, `call_tool` runs other changes, and `call_careful_tool` runs changes that delete something or act outside NativeAI OS (it asks you first). A tool sent to the wrong runner is refused and the answer (JSON with `error: wrong_runner`) names the right one. The skills below name tools such as `expense_create` or `balances`; if one is not in your tool list, find it with `find_tools` and run it with the runner it names. The plugin asks for the whole list with the header `x-mcp-tools: all` (`.mcp.json` for Claude Code, `.codex-mcp.json` for Codex, whose key is `http_headers`), because Claude Code and Codex defer tools themselves and load only the ones they need; `find_tools` and the runners still work. Another client that has no plugin can send the same header, or add `?tools=all` to the server address.

Every change made through the plugin is recorded in NativeAI OS as you via the tool you used. Sending outreach email, approving, scheduling or publishing content, deleting projects, and creating or revoking access tokens are not available to an agent; they stay in the OS.

## Team tasks and shared expenses across NativeAI and Dropshipping

`team-work` and `team-expenses` use the shared team tools that NativeAI OS and Dropshipping OS both expose under the same names (`workspaces`, `team_tasks`, `team_workload`, `expenses`, `balances`, `settlement_record` and the rest). With only NativeAI OS connected they cover NativeAI. To see and change Dropshipping records from here, link your two accounts once in NativeAI OS under Settings, Linked workspaces (you sign in to Dropshipping OS as yourself and approve). Then ask for "across both"; each record keeps its business and is changed in the app that owns it. Nobody else's account is linked by yours, and nothing in the plugin carries credentials.

Differences between surfaces:
- Claude Code and Codex CLI load the skills from this plugin and the tools from the server you signed in to.
- claude.ai and the Claude desktop app use a connector you add yourself (Settings, Connectors, the URL above); plugin skills installed in Claude Code do not travel there, and a local plugin install does not reach cloud sessions.
- The skill text is the same in the Dropshipping OS plugin. Its single source is `skills/team/` in the dropshipping-os repository; `scripts/sync-team-skills.sh <dropshipping-os checkout> --check` fails when this copy drifts.

Versions: 1.3.1 matches the NativeAI OS gateway contract v2.1: `find_tools` takes `query` and `names` only (up to 20 names, a query answers the best 5), the runners take `tool` and `arguments` (the older key `name` is gone), and gateway errors are JSON. 1.3.0 updates the text for the four gateway tools (`call_careful_tool` is new) and changes nothing else. 1.2.0 sends `x-mcp-tools: all` and gives Codex its own MCP file. 1.1.0 adds `team-work` and `team-expenses` and needs a NativeAI OS server with the shared team tools (protocol 1).
