---
name: ontology
description: Manage ontology schemas, concepts, relationships, and alignments for GraphMind knowledge graphs.
---

# /sloth_graphmind:ontology

Manage ontology definitions and validation. Usage: `/sloth_graphmind:ontology <task> [args]`

`$ARGUMENTS` = task + optional ontology item or schema file.

---

## `describe <concept>`

Show ontology concept details.

```python
from sloth_graphmind.ontology import OntologyManager

manager = OntologyManager()
concept = manager.get_concept(concept_name)
```

Output: properties, relationships, inherited types, and examples.

---

## `validate [--schema <file>]`

Validate the graph or schema against the ontology.

```python
result = manager.validate_graph(graph=graph, schema_file=schema_file)
```

Return: validation status, errors, and correction suggestions.
