---
name: design-principles
description: "Must load before designing any system, component, or data model — code architecture, data schemas, research methodology, or analysis frameworks. Do not produce or evaluate designs without this skill."
user-invocable: false
---

# Design Principles

Choose structure and interfaces before logic.

## Single Source of Truth

Each data value, meaning, contract, and rationale has one authoritative home; every other occurrence is generated, referenced, or cached. Unify differently written copies of one fact, but keep identical text separate when the concepts evolve independently. Generate derivable representations; handwritten copies drift.

## Shape Before Processing

Choose data structures before algorithms: put behavior where its data lives and seek a representation that removes traversal complexity or branches. For research, shape the taxonomy or schema before analysis. Define components and communication before implementation so intent is expressed once by the architecture, not reinvented by each function.

## Cost

Shape representation and layout for the dominant access pattern while naming the redundancy-versus-access trade-off. Add an abstraction only when a second concrete use simplifies actual work, never for hypothetical reuse.
