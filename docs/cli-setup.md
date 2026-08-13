---
title: "CLI Setup"
description: "The five GraphMind executables: what each one does, when to use it, and how to confirm it is working."
icon: "terminal"
---

Installing the base package registers five executables on your `PATH`. Each serves a distinct purpose. This page explains what they are, how to verify they are available, and which one to reach for in each situation.


## Installed Commands

```bash
pip install sloth_graphmind
```

After installation the following commands are available:

| Command | Entry point | What it does |
| :------- | :----------- | :------------ |
| `sloth_graphmind` | `sloth_graphmind.cli:main` | General-purpose CLI for pipeline runs, extraction, and graph operations |
| `sloth_graphmind-server` | `sloth_graphmind.server:main` | FastAPI/uvicorn REST API server bound to `0.0.0.0:8000` |
| `sloth_graphmind-worker` | `sloth_graphmind.worker:main` | Background worker process entry point for GraphMind deployments |
| `sloth_graphmind-explorer` | `sloth_graphmind.explorer:main` | Interactive browser dashboard for knowledge graph exploration |
| `sloth_graphmind-mcp` | `sloth_graphmind.mcp_server:main` | MCP server (stdio) for Claude Desktop, Cursor, Windsurf, and other MCP clients |

<Note>
  `sloth_graphmind-explorer` requires `pip install sloth_graphmind[explorer]`. Running it without that extra will immediately print an error and exit. See [Explorer Setup](explorer-setup) for the full walkthrough.
</Note>


## Verify the Installation

Confirm each command is reachable and prints its usage:

```bash
sloth_graphmind --help
sloth_graphmind-server --help
sloth_graphmind-worker --help
sloth_graphmind-explorer --help
sloth_graphmind-mcp --help
```

Confirm the package version:

```bash
python -c "import sloth_graphmind; print(sloth_graphmind.__version__)"
```


## When to Use Each Command

- **sloth_graphmind** — The general-purpose CLI. Use it for one-off pipeline runs, entity extraction, and graph operations from a shell script or CI job.
- **sloth_graphmind-server** — Starts the REST API server. Binds to `0.0.0.0:8000`. Use this when another service or application needs programmatic access to GraphMind over HTTP.
- **sloth_graphmind-worker** — Background task processor. Run alongside `sloth_graphmind-server` when you need async pipeline execution outside the request cycle. Start the server first, then start one or more workers pointing at the same backend.
- **sloth_graphmind-explorer** — Launches the browser dashboard. Requires `pip install sloth_graphmind[explorer]`. Use this to explore a saved knowledge graph interactively. See [Explorer Setup](explorer-setup).
- **sloth_graphmind-mcp** — Runs the MCP server over stdio. Configure it in your MCP client's settings file to expose all 12 tools and 3 resources to Claude Desktop, Cursor, Windsurf, or any MCP-aware client. See [MCP Server](reference/mcp_server).


## Usage Examples

<Tabs>
  <Tab title="REST server">
    ```bash
    # Starts FastAPI + uvicorn on 0.0.0.0:8000
    sloth_graphmind-server
    ```

    Once running, check it with:

    ```bash
    curl http://localhost:8000/health
    # {"status": "ok"}

    curl http://localhost:8000/api/info
    # {"name": "GraphMind API", "version": "...", "status": "active"}
    ```

    The interactive API docs are at `http://localhost:8000/docs`.
  </Tab>
  <Tab title="Worker">
    ```bash
    sloth_graphmind-worker
    ```

    The worker exits cleanly on `SIGINT` (Ctrl-C) or `SIGTERM`.
  </Tab>
  <Tab title="MCP client config">
    Add to your MCP client's settings file:

    ```json
    {
      "mcpServers": {
        "sloth_graphmind": {
          "command": "sloth_graphmind-mcp"
        }
      }
    }
    ```

    Or use the Python module form if the command is not on `PATH`:

    ```json
    {
      "mcpServers": {
        "sloth_graphmind": {
          "command": "python",
          "args": ["-m", "sloth_graphmind.mcp_server"]
        }
      }
    }
    ```

    Test it directly before configuring your client:

    ```bash
    echo '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"test","version":"1.0"}}}' | sloth_graphmind-mcp
    ```

    You should receive a JSON-RPC response. See [MCP Server](reference/mcp_server) for the full list of tools and resources.
  </Tab>
  <Tab title="Explorer">
    ```bash
    pip install sloth_graphmind[explorer]
    sloth_graphmind-explorer --graph my_graph.json
    ```

    See [Explorer Setup](explorer-setup) for the full walkthrough including how to build and save a graph file.
  </Tab>
  <Tab title="Python module form">
    Every command also runs as a Python module: useful when the script directory is not on `PATH`:

    ```bash
    python -m sloth_graphmind.mcp_server
    python -m sloth_graphmind.explorer --graph my_graph.json
    ```
  </Tab>
</Tabs>


## Environment Variables

`sloth_graphmind-mcp` reads two environment variables:

| Variable | Default | Description |
| :-------- | :------- | :----------- |
| `SEMANTICA_KG_PATH` | *(none)* | Path to a saved graph file to load on startup |
| `SEMANTICA_LOG_LEVEL` | `WARNING` | Log verbosity: `DEBUG`, `INFO`, `WARNING` |

`sloth_graphmind-server` reads one:

| Variable | Default | Description |
| :-------- | :------- | :----------- |
| `SEMANTICA_CORS_ORIGINS` | `http://localhost:5173,http://127.0.0.1:5173` | Comma-separated list of allowed CORS origins |

No other environment variables are read by these commands.


## Troubleshooting

<AccordionGroup>

<Accordion title="command not found" icon="terminal">

The executables land in `bin/` (Linux/Mac) or `Scripts/` (Windows) of the active Python environment. If the command is not found, that directory is likely not on `PATH`.

Activate your virtual environment first:

```bash
source venv/bin/activate   # Linux / Mac
venv\Scripts\activate      # Windows
sloth_graphmind --help
```

Find where pip placed the scripts:

```bash
python -m site --user-scripts   # user-level install
pip show -f sloth_graphmind           # shows all installed files
```

</Accordion>

<Accordion title="Command found but crashes on import" icon="triangle-exclamation">

```bash
pip install --upgrade sloth_graphmind
python -c "import sloth_graphmind; print(sloth_graphmind.__version__)"
```

If you have multiple Python environments, install into the one the shell resolves:

```bash
python -m pip install sloth_graphmind
```

</Accordion>

<Accordion title="sloth_graphmind-explorer: uvicorn is required" icon="map">

The Explorer extras are not included in the base install:

```bash
pip install sloth_graphmind[explorer]
```

</Accordion>

<Accordion title="sloth_graphmind-mcp silent failure inside a MCP client" icon="plug">

The MCP server communicates over stdio. Test it directly from the shell first:

```bash
echo '{"jsonrpc":"2.0","id":1,"method":"ping","params":{}}' | sloth_graphmind-mcp
```

A response of `{"jsonrpc":"2.0","id":1,"result":{}}` confirms the server is working. If you see nothing, check that the command is on `PATH` and the base package is installed.

</Accordion>

<Accordion title="Windows: DLL errors on startup" icon="windows">

Install the [Microsoft Visual C++ Redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe). This is a Windows system dependency required by PyTorch and related packages, not a GraphMind bug.

</Accordion>

</AccordionGroup>


## Next Steps

- [Explorer Setup](explorer-setup) — Build a graph, save it, and launch the browser dashboard.
- [MCP Server](reference/mcp_server) — All 12 tools and 3 resources exposed over the MCP protocol.
- [Installation](installation) — Virtual environments, optional extras, and platform-specific notes.
- [Quickstart](quickstart) — End-to-end pipeline walkthrough with working code.
