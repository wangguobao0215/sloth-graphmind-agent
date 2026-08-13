"""
GraphMind MCP Server Package

A full Model Context Protocol (MCP) server for GraphMind — exposes knowledge graph
construction, semantic extraction, decision intelligence, reasoning, analytics,
and export capabilities as MCP tools and resources.

Run the server:
    python -m mcp.server        # from repo root
    python -m sloth_graphmind.mcp_server  # alias inside installed package

Configure in Claude Desktop, Windsurf, Cline, Continue, VS Code:
    {
        "mcpServers": {
            "graphmind": {
                "command": "python",
                "args": ["-m", "mcp.server"],
                "cwd": "/path/to/graphmind"
            }
        }
    }
"""

# `sloth_graphmind.__version__` is the authoritative package version — see
# graphmind/mcp_server/__init__.py for why it is used directly rather than
# importlib.metadata.version("graphmind").
from sloth_graphmind import __version__

from .server import GraphMindMCPServer, main

__all__ = ["GraphMindMCPServer", "main", "__version__"]
