# GraphMind — VS Code Plugin

> **v0.4.0** — Adds GraphMind as an MCP server to VS Code (via GitHub Copilot Chat or any MCP-aware extension).

## MCP Server Setup

Add to your VS Code `settings.json`:

```json
{
  "github.copilot.chat.mcp.servers": {
    "sloth_graphmind": {
      "command": "python",
      "args": ["-m", "sloth_graphmind.mcp_server"]
    }
  }
}
```

Or if using the VS Code MCP extension directly:

```json
{
  "mcp.servers": {
    "sloth_graphmind": {
      "command": "python",
      "args": ["-m", "sloth_graphmind.mcp_server"]
    }
  }
}
```

VS Code will discover all 17 GraphMind skills and 3 agents automatically on connection.

## Knowledge Explorer

Launch the interactive graph dashboard from the terminal:

```bash
sloth_graphmind-explorer --graph my_graph.json --port 8000
```

Open `http://localhost:5174` to explore nodes, edges, decisions, SPARQL, lineage, and more.

## Requirements

- Python 3.10+
- `pip install sloth_graphmind`
