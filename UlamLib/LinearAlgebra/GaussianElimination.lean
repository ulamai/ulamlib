import UlamLib.LinearAlgebra.Echelon

/-!
# `GaussianElimination`

Scaffold for elimination certificates from `notes/RowReduction.tex`.
-/

namespace UlamLib.LinearAlgebra

universe u v w

section Blueprint

variable {K : Type u} [Semiring K]
variable {m : Type v} [DecidableEq m]
variable {n : Type w}

/-- A replayable certificate for a row-reduction pass. -/
structure EliminationCertificate where
  input : Matrix m n K
  output : Matrix m n K
  operations : List (RowOp K m)
  replaysToOutput : RowOp.applyList operations input = output

/- Candidate declarations for this file:
def gaussianElimination (A : Matrix m n K) : EliminationCertificate
theorem gaussianElimination_output_isRowEchelon ...
theorem gaussianElimination_preserves_rank ...
-/

end Blueprint

end UlamLib.LinearAlgebra
