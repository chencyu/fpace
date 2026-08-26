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

Read `references/output.md` when interpreting a report section or judging how far resolution reached. Read `references/languages/<lang>.md` for toolchain requirements before a language's first run in a workspace, and for limitations whenever its results look wrong. An unsupported language prints `unsupported language for <file>` and exits 2.

Do not paraphrase tracer output; cite its `L<n>` references in follow-ups.
