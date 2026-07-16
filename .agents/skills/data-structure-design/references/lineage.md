# Data-Structure Design Lineage

Core: data is more tractable than logic, so move complexity from code into representation. Read this only for rationale or citation.

- **Data over code:** Torvalds distinguishes good programmers by prioritizing data structures and relationships [1].
- **Dissolve special cases:** his pointer-to-pointer list removal makes the head ordinary [2]; Raymond warns that bugs cluster in special-case code and its interactions [3]. Supports Step 4.
- **Algorithms follow representation:** Pike says good structure makes algorithms self-evident; simple algorithms are less buggy and often suit small `n` [3][4]. Supports Step 6 and rejecting clever algorithmic rescue.
- **Tables before flows:** Brooks says tables reveal what flowcharts hide and recommends reorganizing module data first [5]. Supports Step 1.
- **Fold knowledge into data:** Raymond prefers complexity in tractable data over program logic [3]. Supports Step 2.
- **Make illegal states unrepresentable:** King advocates precise structures, boundary parsing that returns refined data, and one source of truth; validation without refinement becomes LangSec's “shotgun parsing” [6][7]. Minsky popularized the slogan [8]. Supports Step 2, refined validation, and SSOT.
- **Reality first; layout last:** Torvalds says practice beats theory [9]. Acton's data-oriented design shapes measured hot data for hardware [10]; Knuth's premature-optimization warning appears in [3]. Supports reality-driven design and correctness-before-layout.

## Sources

[1] Linus Torvalds, linux-kernel / git mailing list, 2006-06-27 — https://lore.kernel.org/all/Pine.LNX.4.64.0607270936200.4168@g5.osdl.org/
[2] Linus Torvalds, "The mind behind Linux", TED 2016 (≈14:10) — https://www.ted.com/talks/linus_torvalds_the_mind_behind_linux ; worked explanation: M. Kirchner, "Linked lists, pointer tricks and good taste" — https://github.com/mkirchner/linked-list-good-taste
[3] Eric S. Raymond, *The Art of Unix Programming* (2003), "Basics of the Unix Philosophy" (Rule of Representation, Rule of Robustness; quotes Pike's rules and Knuth in full) — http://www.catb.org/~esr/writings/taoup/html/ch01s06.html
[4] Rob Pike, *Notes on Programming in C* (1989), Rules 1–6.
[5] Fred Brooks, *The Mythical Man-Month* (1975, Anniversary ed. 1995), pp. 102–3 and ch. 9 — https://en.wikiquote.org/wiki/Fred_Brooks
[6] Alexis King, "Parse, don't validate" (2019-11-05) — https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/
[7] Bratus et al., "The Seven Turrets of Babel: A Taxonomy of LangSec Errors" (2016) — http://langsec.org/papers/langsec-cwes-secdev2016.pdf
[8] Yaron Minsky, "Effective ML" / *Real World OCaml* — "make illegal states unrepresentable".
[9] Linus Torvalds, Linux 2.6.29 announcement, 2009-03-25 — https://lore.kernel.org/all/alpine.LFD.2.00.0903252017100.3032@localhost.localdomain/
[10] Mike Acton, "Data-Oriented Design and C++", CppCon 2014.
