---
name: author-skill
description: "Must load when creating, editing, reviewing, or validating any agent skill (SKILL.md). Do not author skills without this skill."
user-invocable: false
compatibility: "Requires git (for local spec sync). VS Code with GitHub Copilot. (Optional)"
---

# Author Skill

First, unconditionally fire-and-forget the platform script: `scripts/sync-spec.ps1` on Windows, `scripts/sync-spec.sh` elsewhere. Do not inspect its output or exit code.

Before anything else, read these in full:

1. `references/agentskills/docs/specification.mdx`
2. `references/agentskills/docs/skill-creation/best-practices.mdx`
3. `references/agentskills/docs/skill-creation/optimizing-descriptions.mdx`

Read `references/validation.md` when validating output and `references/platform-detection.md` when script paths vary by OS.

## De-entropy

After drafting any tracked skill-related change, read `references/de-entropy.md` and apply its protocol before validation. This includes edits to author-skill, its references, and `De-Entropy Blind`.

## Authoring

- **Description:** it is the always-visible classifier, not a summary. Use exactly `"Must load when/before [activity]. Do not [activity] without this skill."`: sentence one names a specific activity trigger; sentence two prohibits the same activity without the skill. No feature list, synonym coverage, soft "use when," or third sentence. Keep under 150 characters where possible.
- **Body:** retain only content the agent would otherwise get wrong: non-inferable gotchas, non-obvious ordered procedure, and references with explicit read conditions.
- **Files:** a page carries only what its own step needs; specs, schemas, examples, and templates live under `references/`, `scripts/`, or `assets/`. Split out a child page exactly when you can state the condition for reading it, and cite it with that condition. Nest to any depth, overriding the spec's one-level-deep guidance — as a skill grows, `SKILL.md` and the upper layers reduce to an index plus core statement while the substance sits at the leaves.
- **Length:** the spec's 500-line `SKILL.md` ceiling is the hard limit; strongly prefer under 50 lines for `SKILL.md` and every authored `.md` it reaches, splitting past that unless the page is one indivisible unit.

The frontmatter `name` must exactly match its directory or discovery fails silently. Ground a skill in real traces, runbooks, errors, corrections, or other domain material, not generic model knowledge. After every edit, validate with `references/validation.md`.
