import UlamLib.LinearAlgebra.RowOp

/-!
# `Echelon`

Scaffold for pivot data and echelon predicates from `notes/RowReduction.tex`.
-/

namespace UlamLib.LinearAlgebra

universe u v w

/-- Minimal pivot bookkeeping for downstream echelon and RREF APIs. -/
structure PivotData (m : Type v) (n : Type w) where
  rowOrder : List m
  pivotColumn : m → Option n

section Blueprint

variable {K : Type u} [Semiring K]
variable {m : Type v} {n : Type w}

/- Candidate declarations for this file:
def IsRowEchelon (A : Matrix m n K) : Prop
def IsReducedRowEchelon (A : Matrix m n K) : Prop
def pivotColumns (A : Matrix m n K) : List n
theorem pivotColumns_nodup ...
-/

end Blueprint

end UlamLib.LinearAlgebra
