# Contributing

UlamLib is a repository of formalization-ready targets. Good contributions make
the repository easier to formalize, assign, review, and reuse.

## Before you start

1. read [README.md](README.md) for the repo overview
2. read [TRACKS.md](TRACKS.md) for the current decomposition
3. pick an existing issue or open a new one from the track-task template

## Scope

Keep pull requests narrow. A good PR lands one of the following:

- one theorem cluster from a note
- one Lean submodule scaffold
- one note rewrite that makes a target easier to formalize
- one repository-plumbing improvement

Avoid PRs that mix unrelated tracks.

## Naming and layout

- Lean root namespace: `UlamLib`
- Lean root file: `UlamLib.lean`
- note blueprints live under `notes/`
- reusable Lean scaffolds live under `UlamLib/`
- keep note names and Lean module names aligned whenever practical

## Working on notes

Use `notes/TEMPLATE.tex` when you add a new target.

Each note should include:

- a target Lean file or file family
- ambient assumptions
- a declaration blueprint
- labeled definitions and theorems
- a formalization order

Prefer explicit hypotheses over prose.

## Working on Lean scaffolds

Lean scaffolds should be useful before they are complete. That means:

- use narrower imports when you know the dependency surface
- declare ambient variables and section boundaries explicitly
- include module docs and candidate declaration names
- avoid a file that contains only `import Mathlib` and a TODO comment

If you are not proving the final theorem yet, land a scaffold that makes the
next proof pass easier.

## Pull requests

Use the PR template. Reference the issue you are addressing and mention the
note path plus Lean path explicitly.

Before opening a PR, check:

- the changed note still has a clear formalization order
- the changed Lean files use the `UlamLib` namespace
- the README or TRACKS file is updated if the file layout changed

## Repository decisions

These conventions are intentional:

- Track C is the public starter showcase.
- Track B starts in the boundaryless or interior-point setting.
- Track F uses `Module.Invertible` naming and defers cohomology.
- The finite-group representation track is first-class, not a footnote.
