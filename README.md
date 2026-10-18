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

The same skills and the same NativeAI OS server load in the Codex CLI, the IDE extension and the ChatGPT desktop app. The plugin list shows only the seven skills; every NativeAI OS tool comes from the server once you are signed in, and Codex loads them when it needs them.

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

Every change made through the plugin is recorded in NativeAI OS as you via the tool you used. Sending outreach email, approving, scheduling or publishing content, deleting projects, and creating or revoking access tokens are not available to an agent; they stay in the OS.

## Team tasks and shared expenses across NativeAI and Dropshipping

`team-work` and `team-expenses` use the shared team tools that NativeAI OS and Dropshipping OS both expose under the same names (`workspaces`, `team_tasks`, `team_workload`, `expenses`, `balances`, `settlement_record` and the rest). With only NativeAI OS connected they cover NativeAI. To see and change Dropshipping records from here, link your two accounts once in NativeAI OS under Settings, Linked workspaces (you sign in to Dropshipping OS as yourself and approve). Then ask for "across both"; each record keeps its business and is changed in the app that owns it. Nobody else's account is linked by yours, and nothing in the plugin carries credentials.

Differences between surfaces:
- Claude Code and Codex CLI load the skills from this plugin and the tools from the server you signed in to.
- claude.ai and the Claude desktop app use a connector you add yourself (Settings, Connectors, the URL above); plugin skills installed in Claude Code do not travel there, and a local plugin install does not reach cloud sessions.
- The skill text is the same in the Dropshipping OS plugin. Its single source is `skills/team/` in the dropshipping-os repository; `scripts/sync-team-skills.sh <dropshipping-os checkout> --check` fails when this copy drifts.

Versions: 1.1.0 adds `team-work` and `team-expenses` and needs a NativeAI OS server with the shared team tools (protocol 1).
