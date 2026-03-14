# UlamLib

UlamLib is a public starter library of high-value formalization targets for
[UlamAI Prover](https://github.com/ulamai/ulamai). It pairs theorem-dense
LaTeX notes with matching Lean scaffolds so contributors can clone the repo and
start formalizing something useful immediately.

This repository has two audiences:

- users who want prepared targets to formalize with UlamAI
- contributors who want to improve those targets, notes, and scaffolds

If you are new and do not know where to start, read
[START_HERE.md](START_HERE.md) first.

The focus is not "the biggest famous book." The focus is compact reusable Lean
packages that fit UlamAI's current strengths:

- LaTeX to Lean formalization
- segmentation for longer `.tex` files
- per-lemma LaTeX snippet injection
- local declaration retrieval during proof search

That makes medium-size, theorem-dense notes a better target than one giant
textbook.

## What lives here

- `notes/*.tex`: blueprint-style notes intended to be formalized with
  `ulam formalize`
- `UlamLib/**/*.lean`: split Lean scaffolds grouped by reusable submodules
- `TRACKS.md`: the backlog, track decomposition, and milestone structure
- `START_HERE.md`: the beginner-friendly onboarding path
- `CONTRIBUTING.md`: contribution rules and repository conventions
- `notes/TEMPLATE.tex`: a formalization-first template for adding new targets

## Repository layout

```text
notes/
  TEMPLATE.tex
  RowReduction.tex
  MaximalIntegralCurves.tex
  StoneWeierstrassC0.tex
  ManifoldForms.tex
  ProjectiveIncidence.tex
  PicardSpec.tex
  PicardCohomology.tex
  RepresentationSemisimplicity.tex

UlamLib/
  LinearAlgebra/RowReduction.lean
  LinearAlgebra/RowOp.lean
  LinearAlgebra/Echelon.lean
  LinearAlgebra/GaussianElimination.lean
  LinearAlgebra/RREF.lean
  ODE/MaximalIntegralCurves.lean
  ODE/Extendability.lean
  ODE/MaximalIntegralCurve.lean
  ODE/LinearSystems.lean
  Analysis/StoneWeierstrassC0.lean
  Analysis/StoneWeierstrassC0/Defs.lean
  Analysis/StoneWeierstrassC0/Lattice.lean
  Analysis/StoneWeierstrassC0/Real.lean
  Analysis/StoneWeierstrassC0/Complex.lean
  Geometry/ManifoldForms.lean
  Geometry/ManifoldForms/Defs.lean
  Geometry/ManifoldForms/Wedge.lean
  Geometry/ManifoldForms/Pullback.lean
  Geometry/ManifoldForms/ExteriorDerivative.lean
  Geometry/ManifoldForms/DeRhamComplex.lean
  Geometry/ProjectiveIncidence.lean
  Geometry/ProjectiveIncidence/Defs.lean
  Geometry/ProjectiveIncidence/ProjectiveSubspaces.lean
  Geometry/ProjectiveIncidence/Lines.lean
  Geometry/ProjectiveIncidence/Axioms.lean
  Geometry/ProjectiveIncidence/Maps.lean
  AlgebraicGeometry/PicardSpec.lean
  AlgebraicGeometry/PicardSpec/Defs.lean
  AlgebraicGeometry/PicardSpec/LocalCriterion.lean
  AlgebraicGeometry/PicardSpec/Sheafification.lean
  AlgebraicGeometry/PicardCohomology.lean
  RepresentationTheory/Semisimplicity.lean
```

## Quickstart With UlamAI Prover

This section is for users of the repository. If you want to contribute to the
repository itself, you do not need to start by running Ulam locally. Begin with
[START_HERE.md](START_HERE.md) instead.

Install UlamAI:

```bash
brew tap ulamai/ulamai
brew install ulamai
```

Or install from source:

```bash
git clone https://github.com/ulamai/ulamai.git
cd ulamai
./install.sh
```

Authenticate one provider:

```bash
ulam auth codex
# or
ulam auth claude
# or
ulam auth gemini
```

Bootstrap Lean in this repository:

```bash
cd ulamlib
ulam -lean
```

Formalize the showcase starter track:

```bash
ulam formalize notes/StoneWeierstrassC0.tex \
  --out UlamLib/Analysis/StoneWeierstrassC0/Real.lean \
  --segment
```

For longer notes, keep segmentation on and preserve artifacts:

```bash
ulam formalize notes/ManifoldForms.tex \
  --out UlamLib/Geometry/ManifoldForms/Defs.lean \
  --segment \
  --segment-words 1200 \
  --artifacts-dir runs/manifold_forms_defs
```

If you want an LLM-only loop with Lean diagnostics:

```bash
ulam formalize notes/RowReduction.tex \
  --out UlamLib/LinearAlgebra/RowOp.lean \
  --proof-backend llm \
  --lean-backend lsp \
  --segment
```

Notes:

- local declaration retrieval is enabled by default during formalization
- `--segment` is the default recommendation for every note in this repo
- start with Track C, then Track A, before moving to geometry or algebraic
  geometry targets

## New Here?

If this is your first formalization-facing contribution, use this path:

1. read [START_HERE.md](START_HERE.md)
2. choose a small task from [TRACKS.md](TRACKS.md)
3. change one note or one Lean scaffold
4. open a small PR

Good first contributions are things like:

- adding one definition to a scaffold
- adding one or two easy helper lemmas
- tightening assumptions or labels in a note
- splitting an oversized theorem cluster into smaller declarations

## Contributor Plumbing

Before broadening contributor access, this repo now treats repository hygiene as
part of the product:

- [TRACKS.md](TRACKS.md) holds the assignable backlog instead of overloading the
  README
- [CONTRIBUTING.md](CONTRIBUTING.md) defines naming, scope, and PR rules
- [LICENSE](LICENSE) makes the contribution terms explicit
- `.github/ISSUE_TEMPLATE` and `.github/PULL_REQUEST_TEMPLATE.md` provide the
  default collaboration workflow

## Making Notes Formalization-Ready

The notes in this repo are meant to be more than idea sketches. A useful note
for UlamAI should have:

- one clear Lean target file
- an ambient assumptions section that fixes notation and hypotheses up front
- labeled definitions and theorems with stable candidate Lean names
- a seed theorem cluster broken into declarations small enough to formalize
  incrementally
- an explicit dependency order instead of a long proof-heavy narrative
- a clear mapping from note sections to one or more Lean submodules

When adding a new target, start from `notes/TEMPLATE.tex` and keep the note
definition-first. Large proof essays, overloaded notation, and implicit
hypotheses make formalization harder.

## Contributing

The contributor workflow now lives in [CONTRIBUTING.md](CONTRIBUTING.md). The
short version is:

1. pick an issue or open one from the track-task template
2. keep the note blueprint and Lean scaffold aligned
3. submit small PRs that land one theorem cluster or one file family at a time
4. prefer beginner-sized changes over heroic all-in-one patches

The full track backlog, priorities, and decomposition now live in
[TRACKS.md](TRACKS.md).

## References

- [UlamAI Prover](https://github.com/ulamai/ulamai)
- [Mathlib matrix transvections](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/Matrix/Transvection.html)
- [Mathlib integral curves](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.html)
- [Mathlib Stone-Weierstrass](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/ContinuousMap/StoneWeierstrass.html)
- [Mathlib differential forms](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Calculus/DifferentialForm/Basic.html)
- [Mathlib projectivization](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/Projectivization/Independence.html)
- [Mathlib Picard group](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/PicardGroup.html)
- [Mathlib Maschke / finite-group representations](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RepresentationTheory/Maschke.html)
