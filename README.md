# UlamLib

UlamLib is a public starter library of high-value formalization targets for
[UlamAI Prover](https://github.com/ulamai/ulamai). It pairs theorem-dense
LaTeX notes with matching Lean destination files so contributors can clone the
repo and start formalizing something useful immediately.

The focus is not "the biggest famous book." The focus is compact reusable Lean
packages that fit UlamAI's current strengths:

- LaTeX to Lean formalization
- segmentation for longer `.tex` files
- per-lemma LaTeX snippet injection
- local declaration retrieval during proof search

That makes medium-size, theorem-dense notes a better target than one giant
textbook.

## What lives here

- `notes/*.tex`: seed notes intended to be formalized with `ulam formalize`
- `ULAM/**/*.lean`: matching Lean target modules and placeholders
- backlog tracks organized by dependency order and expected difficulty

## Repository layout

```text
notes/
  RowReduction.tex
  MaximalIntegralCurves.tex
  StoneWeierstrassC0.tex
  ManifoldForms.tex
  ProjectiveIncidence.tex
  PicardSpec.tex

ULAM/
  LinearAlgebra/RowReduction.lean
  ODE/MaximalIntegralCurves.lean
  Analysis/StoneWeierstrassC0.lean
  Geometry/ManifoldForms.lean
  Geometry/ProjectiveIncidence.lean
  AlgebraicGeometry/PicardSpec.lean
```

## Quickstart With UlamAI Prover

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

Formalize the easiest first target:

```bash
ulam formalize notes/RowReduction.tex \
  --out ULAM/LinearAlgebra/RowReduction.lean \
  --segment
```

For longer notes, use segmentation and keep artifacts:

```bash
ulam formalize notes/StoneWeierstrassC0.tex \
  --out ULAM/Analysis/StoneWeierstrassC0.lean \
  --segment \
  --segment-words 1200 \
  --artifacts-dir runs/stone_weierstrass
```

If you want an LLM-only loop with Lean diagnostics:

```bash
ulam formalize notes/RowReduction.tex \
  --out ULAM/LinearAlgebra/RowReduction.lean \
  --proof-backend llm \
  --lean-backend lsp \
  --segment
```

Notes:

- local declaration retrieval is enabled by default during formalization
- `--segment` is the default recommendation for every note in this repo
- start with the Track A-C files before moving to the harder geometry or
  algebraic geometry targets

## Best First Targets

The fastest credible first public release is:

1. finite-dimensional linear algebra
2. maximal integral curves / flow layer
3. Stone-Weierstrass for `C_0`

After that, the best next expansion is:

1. manifold differential forms
2. projective incidence geometry

The flagship advanced target is Picard groups and invertible sheaves on
`Spec R`.

## Tracks

### Track A. Finite-dimensional linear algebra

The most immediately useful gap is a student-facing elimination and
canonical-forms package built on top of existing mathlib matrix
infrastructure.

1. row and column operation DSL
2. echelon predicates
3. Gaussian elimination with certificate
4. RREF package
5. canonical-forms bridge

Paths:

- `notes/RowReduction.tex`
- `ULAM/LinearAlgebra/RowReduction.lean`

### Track B. Global ODE / flow layer

mathlib already has local existence and uniqueness machinery. The next layer is
maximal curves and clean global flow statements.

6. extendability predicate
7. maximal integral-curve object
8. uniqueness of maximal curves
9. continuation and global-existence criteria
10. constant and linear systems

Paths:

- `notes/MaximalIntegralCurves.tex`
- `ULAM/ODE/MaximalIntegralCurves.lean`

### Track C. Stone-Weierstrass for `C_0`

This is close to ideal UlamAI material: short definitions, crisp theorems, and
high reuse value.

11. separation API for `C_0(X, k)`
12. lattice and closure lemmas
13. real `C_0` Stone-Weierstrass
14. complex and star version
15. applications file

Paths:

- `notes/StoneWeierstrassC0.tex`
- `ULAM/Analysis/StoneWeierstrassC0.lean`

### Track D. Manifold differential forms

This is a bridge project: mathlib already has the differential-form and
manifold ingredients, but the bundled manifold layer is still thin.

16. bundled manifold `0`- and `1`-forms
17. bundled smooth `n`-forms and wedge product
18. pullback of forms
19. exterior derivative on manifolds
20. `d o d = 0` and the de Rham complex

Paths:

- `notes/ManifoldForms.tex`
- `ULAM/Geometry/ManifoldForms.lean`

### Track E. Projective geometry

This track builds an incidence layer on top of the existing projectivization
machinery.

21. collinearity relation
22. projective lines and incidence
23. two distinct points determine a unique line
24. projective-geometry axioms
25. incidence-preserving maps

Paths:

- `notes/ProjectiveIncidence.tex`
- `ULAM/Geometry/ProjectiveIncidence.lean`

### Track F. Picard / `Spec R`

This is the hardest target in the repo, but also one of the clearest ways for
UlamLib to become strategically important.

26. local criterion for invertible modules
27. module to invertible sheaf on `Spec R`
28. projective constant-rank iff locally free on `Spec R`
29. `Pic R` as invertible sheaves on `Spec R`
30. cohomological formulation

Paths:

- `notes/PicardSpec.tex`
- `ULAM/AlgebraicGeometry/PicardSpec.lean`

## Contributing

Good UlamLib targets have the following shape:

- medium-size notes, not whole books
- clear theorem statements and explicit proof structure
- high reuse value in later formalization projects
- a clean one-to-one mapping from a `.tex` note to a Lean module

When adding a new target:

1. add a note under `notes/`
2. add the matching Lean destination under `ULAM/`
3. keep the dependency order explicit
4. prefer theorem clusters that can be formalized incrementally

## References

- [UlamAI Prover](https://github.com/ulamai/ulamai)
- [Mathlib matrix transvections](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/Matrix/Transvection.html)
- [Mathlib integral curves](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.html)
- [Mathlib Stone-Weierstrass](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/ContinuousMap/StoneWeierstrass.html)
- [Mathlib differential forms](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Calculus/DifferentialForm/Basic.html)
- [Mathlib projectivization](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/Projectivization/Independence.html)
- [Mathlib Picard group](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/PicardGroup.html)
