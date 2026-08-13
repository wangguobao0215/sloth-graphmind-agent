---
title: "Contributing"
description: "How to contribute code, documentation, tests, and community support to GraphMind."
icon: "code-pull-request"
---

Contributions of all kinds are welcome: code, documentation, tests, and community support. Every contribution is recognized in release notes and the GitHub contributors list.


## Quick Start

```bash
# Fork the repo on GitHub, then:
git clone https://github.com/your-username/sloth_graphmind.git
cd sloth_graphmind
pip install -e ".[dev]"
pytest
```

New to the project? Start with [`good-first-issue`](https://github.com/sloth_graphmind-agi/sloth_graphmind/labels/good-first-issue) labeled tickets: they're scoped to be completable in a few hours without deep codebase knowledge.


## Ways to Contribute

- **Code** — Fix bugs, implement features, optimize performance, or add new ingestors, parsers, and exporters using the plugin registry.
- **Documentation** — Fix typos, improve clarity, add missing examples, write tutorials, or keep the API reference accurate as modules evolve.
- **Testing** — Add test coverage for untested modules or edge cases, reproduce reported bugs with minimal repros, or improve cross-platform reliability.
- **Community** — Answer questions in GitHub Issues and Discussions, review pull requests with constructive feedback, or share GraphMind in blog posts and talks.


## Development Setup

```bash
git clone https://github.com/your-username/sloth_graphmind.git
cd sloth_graphmind
pip install -e ".[dev]"
```

**Code style tools:**

```bash
pytest                      # full test suite
black sloth_graphmind/ tests/     # auto-format
isort sloth_graphmind/ tests/     # sort imports
flake8 sloth_graphmind/           # lint
```

Style conventions: **Black** for formatting, **isort** for imports, **flake8** for linting. All three run in CI.


## Reporting Issues

**Bug reports** should include:

- What happened vs. what you expected
- Minimal steps to reproduce
- Your environment: Python version, OS, GraphMind version (`python -c "import sloth_graphmind; print(sloth_graphmind.__version__)"`)

**Feature requests** should include:

- Your concrete use case
- What you'd like GraphMind to do
- Why it benefits a broad set of users, not just your specific workflow


## Pull Request Checklist

Before submitting a PR, confirm:

<Check>Tests pass locally: `pytest`</Check>
<Check>New features include documentation with working code examples</Check>
<Check>Code follows project style: Black, isort, flake8</Check>
<Check>Commit messages are clear and describe the *why*, not just the *what*</Check>
<Check>No unresolved merge conflicts</Check>


## Code of Conduct

All contributors are expected to follow the [Contributor Covenant Code of Conduct](https://github.com/sloth_graphmind-agi/sloth_graphmind/blob/main/CODE_OF_CONDUCT.md). Be respectful, patient, and constructive: especially toward newcomers. Report violations by opening an issue with the `[CoC]` prefix.


## Help

- [GitHub Issues](https://github.com/sloth_graphmind-agi/sloth_graphmind/issues)
- [GitHub Discussions](https://github.com/sloth_graphmind-agi/sloth_graphmind/discussions)
- [Discord](https://discord.gg/sV34vps5hH)

- [Community](community) — Community guidelines and values.
- [Governance](governance) — How decisions are made and the project is run.
