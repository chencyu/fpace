---
name: algorithm-selector
description: "Must load before attempting to solve a problem with an algorithm. Do not select or implement algorithmic solutions without this skill."
---

# Algorithm Selector

Use after decomposition exposes the problem's generating core and before algorithm design or implementation; skip tasks without algorithmic substance.

1. Extract input shape, required output, and verifiable constraints.
2. Run `python scripts/matcher.py --tags`, then select every applicable tag in this order: observable **Input Structure**, required **Output Goal**, directly stated **Problem Property**, and only as a last resort **Paradigm**. Never infer a property from a contemplated solution; let the catalog surface paradigms.
3. Run `python scripts/matcher.py <tags...>`. Keep the default `--min-overlap 2` for recall or raise it to 3+ to narrow.
4. For each candidate, recall its preconditions, complexity, and uses from its name; reject it unless its assumptions hold. Check related algorithms suggested by its paradigm even if absent from the result set.
5. Report ranked candidates and match reasons, rejected candidates and violated assumptions, or explicitly that none fits and a novel approach may be needed.

Never skip tag selection or force a weak match. `scripts/catalog.py` owns the tag vocabulary and algorithm catalog; `scripts/matcher.py` owns matching and its CLI.
