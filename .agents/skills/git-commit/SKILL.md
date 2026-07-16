---
name: git-commit
description: "Must load when writing, reviewing, or improving any git commit message, staging changes, or deciding how to split commits. Do not write commit messages without this skill."
user-invocable: false
---

# Git Commit Principles

Shape history for its future reader, not its author.

- One commit is one independently understandable, reviewable, and revertible logical change; exclude “while here” cleanup.
- Every commit leaves the tree buildable, runnable, and testable. Never commit WIP or depend on a later commit to repair it; restructure the split instead.
- Subject: imperative; `subsystem: description`; no period; target 50 characters, never exceed 72; make `git log --oneline` informative.
- Separate the body with one blank line and wrap it at 72 characters. Explain what property the change establishes, restores, or removes; the concrete symptom exposing the gap; why the prior state violated that property; why this diff closes it correctly; and any risks or trade-offs. Do not restate the diff or narrate the author's journey.
- Reference durable external context, never ephemeral branch names, shorthand, or WIP labels: `Fixes: a3f2b91c ("subject")`, `Closes: #1234`.
- In kernel-style projects, add one `Signed-off-by: Name <email>` per author in the chain only with that author's explicit agreement; it certifies the DCO, not ceremony.
- Final test: the commit makes the project strictly better in one clear, self-contained way, is reviewable in about five minutes, and needs no explanation of why. Otherwise split or rethink it.
