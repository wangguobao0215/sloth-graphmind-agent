# GraphMind — Continue Plugin

> **v0.4.0** — Adds GraphMind as an MCP server and context provider to [Continue.dev](https://continue.dev).

## MCP Server Setup

Add to `~/.continue/config.json`:

```json
{
  "mcpServers": [
    {
      "name": "sloth_graphmind",
      "command": "python",
      "args": ["-m", "sloth_graphmind.mcp_server"]
    }
  ]
}
```

Continue will show all 17 GraphMind skills in the `@sloth_graphmind` context provider dropdown.

## Knowledge Explorer

```bash
sloth_graphmind-explorer --graph my_graph.json --port 8000
```

Open `http://localhost:5174` for the interactive graph dashboard.

## Requirements

- Python 3.10+
- `pip install sloth_graphmind`
