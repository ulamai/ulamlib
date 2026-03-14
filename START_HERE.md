# Start Here

This file is for people who want to contribute to UlamLib but do not yet know
where to start.

You do not need to solve a whole track. A good first contribution is tiny.

## What this repository is

UlamLib is a library of prepared formalization targets:

- blueprint-style notes in `notes/`
- Lean scaffolds in `UlamLib/`
- a track backlog in [TRACKS.md](TRACKS.md)

The goal is to make it easy for someone else to open the repo and immediately
find a useful theorem cluster to formalize.

## Best first contributions

Pick one of these:

1. tighten one note
2. add one small helper lemma
3. improve one scaffold comment or declaration stub
4. split one oversized task into smaller assignable pieces

That is enough for a first PR.

## Easiest starting lanes

### Lane 1. Note-only improvements

Good if you are comfortable reading math but do not want to touch Lean yet.

Examples:

- add missing ambient assumptions
- add labels to unnamed theorems
- break one theorem into two lemmas and one theorem
- add candidate Lean names

Best files:

- `notes/StoneWeierstrassC0.tex`
- `notes/RowReduction.tex`
- `notes/TEMPLATE.tex`

### Lane 2. Very small Lean helper lemmas

Good if you want a first Lean change without taking on a theorem.

Examples:

- prove a monotonicity lemma for a predicate
- prove a `nil` or `cons` lemma for a helper function
- add a reflexive or transitive lemma for a small structure

Best files:

- `UlamLib/Analysis/StoneWeierstrassC0/Defs.lean`
- `UlamLib/LinearAlgebra/RowOp.lean`
- `UlamLib/ODE/Extendability.lean`

### Lane 3. First real theorem-cluster work

Good if you already know Lean and want a focused starter target.

Start here:

- Track C first
- then Track A

Avoid starting with:

- Picard on `Spec R`
- de Rham complex
- full projective axiom packaging

## What a first PR should look like

A good first PR usually changes one of:

- one note file
- one Lean scaffold file
- one small docs file

Try to keep the scope to one definition or one short cluster of helper lemmas.

## Terms you will see

- `note`: the blueprint `.tex` file
- `scaffold`: a Lean file with imports, namespaces, ambient variables, and
  candidate declarations
- `track`: a family of related notes and Lean files
- `theorem cluster`: a small group of declarations that belong together

## Recommended first targets

If you want one concrete answer, use one of these:

1. add one extra helper lemma to `UlamLib/Analysis/StoneWeierstrassC0/Defs.lean`
2. improve one section of `notes/StoneWeierstrassC0.tex`
3. add one more simple lemma to `UlamLib/LinearAlgebra/RowOp.lean`

Then open a small PR and stop there.
