---
name: git-commit
description: "Must load before writing a git commit message, staging changes, or splitting commits. Do not write commit messages without this skill."
user-invocable: false
---

# Git Commit Principles

Shape history for its future reader, not its author.

- The diff carries only what changed. Before writing the message, recover the why from the session: the request or symptom that started the work, the constraints and corrections the user imposed, and the approaches abandoned. Reconcile that account against the staged diff — a claim absent from the diff is misattributed; a staged change the account does not explain belongs in another commit.
- One commit is one independently understandable, reviewable, and revertible logical change; exclude “while here” cleanup.
- Every commit leaves the tree buildable, runnable, and testable. Never commit WIP or depend on a later commit to repair it; restructure the split instead.
- Subject: imperative; `subsystem: description`; no period; target 50 characters, never exceed 72; make `git log --oneline` informative.
- Separate the body with one blank line and wrap it at 72 characters. Explain what property the change establishes, restores, or removes; the concrete symptom exposing the gap; why the prior state violated that property; why this diff closes it correctly; and any risks or trade-offs. Do not restate the diff or narrate the author's journey.
- Reference durable external context, never ephemeral branch names, shorthand, or WIP labels: `Fixes: a3f2b91c ("subject")`, `Closes: #1234`.
- In kernel-style projects, add one `Signed-off-by: Name <email>` per author in the chain only with that author's explicit agreement; it certifies the DCO, not ceremony.
- Final test: the commit makes the project strictly better in one clear, self-contained way, is reviewable in about five minutes, and needs no explanation of why. Otherwise split or rethink it.
