# Tracer Output

Report sections, in order:

1. **Source:** fenced, numbered queried lines.
2. **Variable origins:** every loaded `Name`; initial binding, all reassignments/aug-assigns, scope, annotation, and parameter owner; project-local import chains end at the definition.
3. **Call bindings:** every `Call`, through imports, class construction, and attributes. Steps are `binding`, `module-file`, `instance`, `external`, `builtin`, `unresolved`, `star-import`, `cycle`, or `depth-limit`.
4. **Implicit invariants:** enclosing context managers and try/catch/finally semantics; prior same-function asserts; enclosing-function decorators and their chains; variable/parameter/return annotations; auto-managed `with` resources, matched manual acquire/release, and unpaired-acquire hazards; mutable defaults, global writes, bare `except`, I/O-like calls, attribute mutations, and subscript writes.

## Resolution reach

Resolution never leaves the project root. It follows project-local `import pkg.mod` calls, `from pkg.mod import X` including re-exports and cycles, `from pkg import submod`, class instances and methods including direct bases, and package-relative imports. It marks stdlib/third-party modules `external`, wildcard imports `star-import`, and does not follow dynamic attributes, `getattr`, or reflection.
