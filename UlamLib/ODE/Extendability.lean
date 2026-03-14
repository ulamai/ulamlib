import Mathlib.Geometry.Manifold.IntegralCurve.ExistUnique

/-!
# `Extendability`

Scaffold for endpoint extendability in the boundaryless or interior-point
setting.
-/

namespace UlamLib.ODE

section Blueprint

variable {M : Type*}

/-- Abstract extension data for one curve by another on a larger time set. -/
structure IntegralCurveExtension (I J : Set ℝ) (γ γ' : ℝ → M) : Prop where
  subset : I ⊆ J
  eqOn : Set.EqOn γ γ' I

/-- Blueprint predicate for right extendability. -/
def IsRightExtendable (I : Set ℝ) (γ : ℝ → M) : Prop :=
  ∃ J γ', IntegralCurveExtension I J γ γ'

/-- Blueprint predicate for left extendability. -/
def IsLeftExtendable (I : Set ℝ) (γ : ℝ → M) : Prop :=
  ∃ J γ', IntegralCurveExtension I J γ γ'

/- Candidate declarations for this file:
def compatibleOnOverlap ...
theorem gluable_of_compatibleOnOverlap ...
-/

end Blueprint

end UlamLib.ODE
