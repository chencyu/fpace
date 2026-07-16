# De-Entropy Protocol

Use this protocol after drafting any skill-related tracked change and before
validating it. It reduces representation, never precision, value, or a
correct domain abstraction.

## Scope

1. Diff the intended tracked files against their pre-edit state.
2. Exclude material the user marks human-facing, explanatory, or intentionally
   abstract; preserve it verbatim unless the user withdraws that boundary.
3. Treat every declaration, paragraph, list item, table row, comment, error
   string, public name, and configuration entry as a semantic unit.

## Candidate

For one unit only, record its hidden contract: purpose, facts, requirements,
prohibitions, pre/postconditions, ordering, stops, exceptions, failures,
public names, and diagnostic or abstraction value.

Propose a shorter replacement only when it removes duplicate representation or
makes an existing authoritative representation the sole source of truth. Do
not minify identifiers, delete rationale, weaken readability, or remove a
future-expert seam merely because it is currently unused.

## Blind equivalence

1. Send the replacement alone—without path, original text, surrounding
   context, skill names, or evaluation hints—to the `De-Entropy Blind` agent.
2. Compare its JSON reconstruction claim-by-claim with the hidden contract.
3. Accept only zero lost, invented, strengthened, weakened, or newly ambiguous
   claims. Otherwise revise once; if no shorter equivalent remains, retain the
   source as `already-minimal`.

## Apply and verify

Apply one accepted candidate at a time. For code/configuration, run the
narrowest syntax, validator, differential, or golden test that observes its
contract; rerun it after editing. For skills, also validate frontmatter and VS
Code diagnostics. Check `git diff --check` before completion.

## Self-application

This protocol governs edits to `author-skill` itself. Before changing this
skill, its references, or the blind agent, apply every step above to that
change; the protocol cannot exempt its own implementation.
