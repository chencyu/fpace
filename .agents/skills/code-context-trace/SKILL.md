---
name: code-context-trace
description: "Must load before tracing variable origins, callee definitions, or implicit invariants over a code range. Do not perform such tracing without this skill."
---

# Code Context Trace

Use the deterministic AST tracer instead of manual search when asked for variable origins, actual callees, or implicit invariants; before editing a non-trivial range whose origins/callees are not visible; or before correctness reasoning inside unseen decorators, `with`, or `try`. Skip a fully self-contained range whose symbols are all defined within it.

Run:

`python scripts/trace.py <file> <range> [--lang python|rust] [--project-root <dir>] [--json]`

- `<file>`: absolute or workspace-relative source path.
- `<range>`: `L10-L25`, `10-25`, `10:25`, or `L10` (`L10-L10`).
- `--lang`: override extension-first, shebang-fallback detection.
- `--project-root`: override upward discovery by `pyproject.toml`, `setup.py`, `setup.cfg`, `Pipfile`, `requirements.txt`, `Cargo.toml`, `.git`, or `.hg`.
- `--json`: use only for a tool caller; default Markdown omits empty sections.

## Output

1. **Source:** fenced, numbered queried lines.
2. **Variable origins:** every loaded `Name`; initial binding, all reassignments/aug-assigns, scope, annotation, and parameter owner; project-local import chains end at the definition.
3. **Call bindings:** every `Call`, through imports, class construction, and attributes. Steps are `binding`, `module-file`, `instance`, `external`, `builtin`, `unresolved`, `star-import`, `cycle`, or `depth-limit`.
4. **Implicit invariants:** enclosing context managers and try/catch/finally semantics; prior same-function asserts; enclosing-function decorators and their chains; variable/parameter/return annotations; auto-managed `with` resources, matched manual acquire/release, and unpaired-acquire hazards; mutable defaults, global writes, bare `except`, I/O-like calls, attribute mutations, and subscript writes.

Resolution never leaves the project root. It follows project-local `import pkg.mod` calls, `from pkg.mod import X` including re-exports and cycles, `from pkg import submod`, class instances and methods including direct bases, and package-relative imports. It marks stdlib/third-party modules `external`, wildcard imports `star-import`, and does not follow dynamic attributes, `getattr`, or reflection.

## Languages

**Python:** stdlib `ast`, no external dependency. Limitations: a rebound object's first class binding wins; the earliest conditional import wins; inherited methods follow direct bases recursively with cycle protection but diamond order is best-effort rather than strict MRO; side-effect detection is name/AST-shape heuristic; Python 3.8+ is required for `ast.end_lineno`.

**Rust:** `scripts/rust_tracer/` auto-builds once with `cargo build --release`; a Rust toolchain is required, MSRV 1.70+, tested through 1.94, using `syn` 2.x. It resolves `mod foo;` across `mod.rs`/`foo.rs`, lib/bin/workspace members; aliased `use`, `pub use`, `crate::`/`self::`/`super::`/sibling-crate paths; associated functions; inherent and trait impl methods. It reports `unsafe`, `?`, panic surfaces, mutable bindings, annotations, lifetimes, `cfg`, attribute macros, I/O macros, and mutating methods; standard prelude names are not unresolved. Limitations: no macro expansion; inline modules are indexed but not deeply file-walked; receivers without discoverable types become `unresolved-method`; workspace `crates/*` globs expand direct subfolders only; external crates are marked, not traversed.

Other languages print `unsupported language for <file>` and exit 2. Detection is extension then shebang unless forced.

Do not paraphrase tracer output; cite its `L<n>` references in follow-ups.
