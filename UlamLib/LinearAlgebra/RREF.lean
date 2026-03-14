import UlamLib.LinearAlgebra.GaussianElimination

/-!
# `RREF`

Scaffold for reduced row echelon form and kernel extraction.
-/

namespace UlamLib.LinearAlgebra

universe u v w

section Blueprint

variable {K : Type u} [Semiring K]
variable {m : Type v} [DecidableEq m]
variable {n : Type w}

/-- Candidate packaged output of an RREF computation. -/
structure RREFResult where
  certificate : EliminationCertificate (K := K) (m := m) (n := n)
  pivotColumns : List n

/- Candidate declarations for this file:
def rref (A : Matrix m n K) : RREFResult
theorem rank_eq_pivotCount ...
theorem basisOfKernel_from_rref ...
-/

end Blueprint

end UlamLib.LinearAlgebra
