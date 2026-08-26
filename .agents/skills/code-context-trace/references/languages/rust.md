# Rust

`scripts/rust_tracer/` auto-builds once with `cargo build --release`; a Rust toolchain is required, MSRV 1.70+, tested through 1.94, using `syn` 2.x.

It resolves `mod foo;` across `mod.rs`/`foo.rs`, lib/bin/workspace members; aliased `use`, `pub use`, `crate::`/`self::`/`super::`/sibling-crate paths; associated functions; inherent and trait impl methods. It reports `unsafe`, `?`, panic surfaces, mutable bindings, annotations, lifetimes, `cfg`, attribute macros, I/O macros, and mutating methods; standard prelude names are not unresolved.

Limitations: no macro expansion; inline modules are indexed but not deeply file-walked; receivers without discoverable types become `unresolved-method`; workspace `crates/*` globs expand direct subfolders only; external crates are marked, not traversed.
