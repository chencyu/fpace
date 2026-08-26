# Python

Uses the stdlib `ast` module, so it has no external dependency, but requires Python 3.8+ for `ast.end_lineno`.

Limitations: a rebound object's first class binding wins; the earliest conditional import wins; inherited methods follow direct bases recursively with cycle protection, but diamond order is best-effort rather than strict MRO; side-effect detection is a name/AST-shape heuristic.
