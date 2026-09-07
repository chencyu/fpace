# Shared Content Contract

**Preserve meaning and required value; remove only avoidable representation and decoding burden.** Character count is not the objective.

Scope follows purpose, not file type or version control: content for humans or AI in chat, documents, prompts, skills, and embedded strings is governed here. Executable logic remains under its domain-specific rules.

## Two faces, one workflow

| Face | Operation |
| --- | --- |
| `content-writing` | Contract → candidate representation |
| `content-de-entropy` | Baseline + candidate → verify → accept or retain |

Load both before acting. Resolve the mutual dependency as one pair, not recursive load requests. Both phases apply to both skills, this contract, their references, and instructions used by their auditors; neither skill exempts its own implementation.

## Establish the baseline

- Existing content → freeze its pre-edit representation and record its contract before proposing replacements.
- New content → derive the contract from the request and grounded material; freeze the first draft as the reduction baseline, not as authority for invented claims.
- Authorized changes of meaning → record the changed requirements separately; check them against the request, then audit representation changes against that updated contract.
- User-protected passages → preserve verbatim unless the user withdraws that boundary. Merely addressing humans or AI is not an exemption from this workflow.

## Preserve the contract

| Dimension | What must survive |
| --- | --- |
| Meaning | Purpose, facts, claims, and their scope |
| Force | Requirements, prohibitions, permission, obligation, uncertainty |
| Conditions | Pre/postconditions, ordering, stops, exceptions, failures |
| Identity and measure | Public names, referents, quantities, units |
| Required value | Rationale, diagnostic value, correct abstraction, readability, intended rhetorical effect, future-expert usefulness |
| Delivery | Required wording, format, accessible references, destination rendering |

Accept a replacement only if no claim is lost, invented, strengthened, weakened, or made newly ambiguous. Every contract dimension must also survive; a shorter spelling, missing rationale, or removed extension seam is not a gain merely because it saves space.

One meaning has one authoritative home; other occurrences point to it unless the contract requires repetition. References must resolve for the recipient and preserve access to the meaning they replace.

## Finite self-application

Audit scope = the frozen target artifact, including either skill when it is being edited. Audit bookkeeping is evidence about that target, not a recursively generated new target. Proposed reductions follow the bounded audit in `content-de-entropy`; stop when none can be justified without contract loss.