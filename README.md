# NativeAI OS for Claude Code and Codex

The `nativeai-os` plugin connects Claude Code or Codex to NativeAI OS (`https://os.nativeai.agency/api/mcp/mcp`), signed in as you with your NativeAI OS account, and adds four shortcuts: `my-day`, `company`, `replies` and `team-docs`.

## Claude Code

In a terminal:

```
claude plugin marketplace add amadejdemsar-create/nativeai-os-plugin
claude plugin install nativeai-os@nativeai
```

Then run `/mcp` in Claude Code, pick `plugin:nativeai-os:nativeai-os` and sign in. Only people with a NativeAI OS account can sign in; the plugin holds no credentials. The shortcuts are `/nativeai-os:my-day`, `/nativeai-os:company`, `/nativeai-os:replies` and `/nativeai-os:team-docs`.

## Codex

```
codex plugin marketplace add amadejdemsar-create/nativeai-os-plugin
codex plugin add nativeai-os@nativeai
codex mcp login nativeai-os
```

The same skills and the same NativeAI OS server load in the Codex CLI, the IDE extension and the ChatGPT desktop app. The plugin list shows only the four skills; every NativeAI OS tool comes from the server once you are signed in, and Codex loads them when it needs them.

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

A client that cannot sign in with OAuth can send a personal token instead (`Authorization: Bearer <token>`), made on https://os.nativeai.agency/settings/connect.

## What stays with you

Every change made through the plugin is recorded in NativeAI OS as you via the tool you used. Sending outreach email, approving, scheduling or publishing content, deleting projects, and creating or revoking access tokens are not available to an agent; they stay in the OS.
