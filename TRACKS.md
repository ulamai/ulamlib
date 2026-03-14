# Tracks

This file is the assignable backlog for UlamLib. The README stays short; track
planning, decomposition, and milestone structure live here.

## Difficulty Key

- `starter`: suitable for a first or second contribution
- `intermediate`: requires comfort with Lean and mathlib navigation
- `advanced`: substantial project work, not a first task

## Beginner Lanes

If you do not know where to start, use one of these:

1. `starter`: add helper lemmas in `UlamLib/Analysis/StoneWeierstrassC0/Defs.lean`
2. `starter`: add helper lemmas in `UlamLib/LinearAlgebra/RowOp.lean`
3. `starter`: improve assumptions and labels in `notes/StoneWeierstrassC0.tex`
4. `starter`: improve assumptions and labels in `notes/RowReduction.tex`

The best first theorem-facing track is Track C. The best first scaffold track is
Track A.

## Milestones

1. `starter-showcase`: Stone-Weierstrass for `C_0`, plus the first reusable
   linear-algebra scaffolds.
2. `starter-core`: row operations, echelon predicates, Gaussian elimination,
   and reduced row echelon form packaging.
3. `flow-layer`: extendability and maximal integral curves in the boundaryless
   or interior-point setting.
4. `geometry-bridge`: bundled manifold forms and projective incidence layers.
5. `advanced-algebraic-geometry`: Picard on `Spec R`, without cohomology.
6. `advanced-representation-theory`: finite-group representation
   semisimplicity.
7. `follow-on-cohomology`: the Picard-to-`H^1` bridge.

## Track A. Finite-Dimensional Linear Algebra

Status: starter-core
Difficulty: starter to intermediate

Notes:

- `notes/RowReduction.tex`

Lean modules:

- `UlamLib/LinearAlgebra/RowOp.lean`
- `UlamLib/LinearAlgebra/Echelon.lean`
- `UlamLib/LinearAlgebra/GaussianElimination.lean`
- `UlamLib/LinearAlgebra/RREF.lean`
- `UlamLib/LinearAlgebra/RowReduction.lean`

Issue decomposition:

1. `starter`: row and column operation DSL
2. `starter`: echelon predicates and pivot data
3. `intermediate`: Gaussian elimination with certificate
4. `intermediate`: reduced row echelon form packaging
5. `advanced`: canonical-form bridges

Good first files:

- `UlamLib/LinearAlgebra/RowOp.lean`
- `UlamLib/LinearAlgebra/Echelon.lean`

## Track B. Global ODE / Flow Layer

Status: flow-layer
Difficulty: intermediate

Scope restriction:

- first public scope is the boundaryless or interior-point case
- boundary behavior should be postponed to a follow-up note

Notes:

- `notes/MaximalIntegralCurves.tex`

Lean modules:

- `UlamLib/ODE/Extendability.lean`
- `UlamLib/ODE/MaximalIntegralCurve.lean`
- `UlamLib/ODE/LinearSystems.lean`
- `UlamLib/ODE/MaximalIntegralCurves.lean`

Issue decomposition:

1. extendability predicates
2. maximal integral-curve object
3. uniqueness on overlaps
4. continuation criteria
5. constant and linear systems

## Track C. Stone-Weierstrass for `C_0`

Status: starter-showcase
Difficulty: starter to intermediate

Why this is the showcase starter:

- compact statement surface
- high reuse value
- crisp theorem cluster
- clear future-work signal in mathlib docs

Notes:

- `notes/StoneWeierstrassC0.tex`

Lean modules:

- `UlamLib/Analysis/StoneWeierstrassC0/Defs.lean`
- `UlamLib/Analysis/StoneWeierstrassC0/Lattice.lean`
- `UlamLib/Analysis/StoneWeierstrassC0/Real.lean`
- `UlamLib/Analysis/StoneWeierstrassC0/Complex.lean`
- `UlamLib/Analysis/StoneWeierstrassC0.lean`

Issue decomposition:

1. `starter`: separation API for `C_0(X, k)`
2. `starter`: nonvanishing API
3. `starter`: lattice and closure lemmas
4. `intermediate`: real `C_0` Stone-Weierstrass
5. `advanced`: complex and star version
6. `starter`: applications and examples

Good first files:

- `UlamLib/Analysis/StoneWeierstrassC0/Defs.lean`
- `UlamLib/Analysis/StoneWeierstrassC0/Lattice.lean`
- `notes/StoneWeierstrassC0.tex`

## Track D. Manifold Differential Forms

Status: geometry-bridge
Difficulty: intermediate to advanced

Notes:

- `notes/ManifoldForms.tex`

Lean modules:

- `UlamLib/Geometry/ManifoldForms/Defs.lean`
- `UlamLib/Geometry/ManifoldForms/Wedge.lean`
- `UlamLib/Geometry/ManifoldForms/Pullback.lean`
- `UlamLib/Geometry/ManifoldForms/ExteriorDerivative.lean`
- `UlamLib/Geometry/ManifoldForms/DeRhamComplex.lean`
- `UlamLib/Geometry/ManifoldForms.lean`

Issue decomposition:

1. `intermediate`: bundled `0`- and `1`-forms plus notation
2. `intermediate`: bundled smooth `n`-forms
3. `intermediate`: wedge product
4. `intermediate`: pullback
5. `advanced`: exterior derivative
6. `advanced`: de Rham complex

## Track E. Projective Geometry

Status: geometry-bridge
Difficulty: intermediate to advanced

Notes:

- `notes/ProjectiveIncidence.tex`

Lean modules:

- `UlamLib/Geometry/ProjectiveIncidence/Defs.lean`
- `UlamLib/Geometry/ProjectiveIncidence/ProjectiveSubspaces.lean`
- `UlamLib/Geometry/ProjectiveIncidence/Lines.lean`
- `UlamLib/Geometry/ProjectiveIncidence/Axioms.lean`
- `UlamLib/Geometry/ProjectiveIncidence/Maps.lean`
- `UlamLib/Geometry/ProjectiveIncidence.lean`

Issue decomposition:

1. `intermediate`: collinearity relation
2. `intermediate`: projective lines and incidence
3. `intermediate`: two distinct points determine a unique line
4. `advanced`: projective-geometry axioms
5. `advanced`: incidence-preserving maps
6. `intermediate`: projective subspaces

## Track F. Picard on `Spec R`

Status: advanced-algebraic-geometry
Difficulty: advanced

Scope restriction:

- align to the existing `Module.Invertible` naming in mathlib
- keep the `H^1` description out of the first-stage note

Notes:

- `notes/PicardSpec.tex`

Lean modules:

- `UlamLib/AlgebraicGeometry/PicardSpec/Defs.lean`
- `UlamLib/AlgebraicGeometry/PicardSpec/LocalCriterion.lean`
- `UlamLib/AlgebraicGeometry/PicardSpec/Sheafification.lean`
- `UlamLib/AlgebraicGeometry/PicardSpec.lean`

Issue decomposition:

1. `advanced`: local rank-one criterion via `Module.Invertible`
2. `advanced`: invertible module to invertible sheaf
3. `advanced`: locally free constant-rank bridge
4. `advanced`: Picard identification on `Spec R`

Follow-on note:

- `notes/PicardCohomology.tex`
- `UlamLib/AlgebraicGeometry/PicardCohomology.lean`

## Track G. Finite-Group Representation Semisimplicity

Status: advanced-representation-theory
Difficulty: advanced

Notes:

- `notes/RepresentationSemisimplicity.tex`

Lean modules:

- `UlamLib/RepresentationTheory/Semisimplicity.lean`

Issue decomposition:

1. `advanced`: semisimple decomposition into simples
2. `advanced`: finite direct-sum existence
3. `advanced`: character decomposition against irreducibles
4. `advanced`: equivalence to modules over the group algebra
5. `advanced`: abelianity and finite colimits of `FDRep`
