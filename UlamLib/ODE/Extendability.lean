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

namespace IntegralCurveExtension

theorem refl (I : Set ℝ) (γ : ℝ → M) :
    IntegralCurveExtension I I γ γ := by
  refine ⟨by intro x hx; exact hx, ?_⟩
  intro x hx
  rfl

theorem trans {I J K : Set ℝ} {γ γ' γ'' : ℝ → M}
    (hIJ : IntegralCurveExtension I J γ γ')
    (hJK : IntegralCurveExtension J K γ' γ'') :
    IntegralCurveExtension I K γ γ'' := by
  refine ⟨Set.Subset.trans hIJ.subset hJK.subset, ?_⟩
  intro x hx
  rw [hIJ.eqOn hx, hJK.eqOn (hIJ.subset hx)]

end IntegralCurveExtension

/-- Blueprint predicate for right extendability. -/
def IsRightExtendable (I : Set ℝ) (γ : ℝ → M) : Prop :=
  ∃ J γ', IntegralCurveExtension I J γ γ'

/-- Blueprint predicate for left extendability. -/
def IsLeftExtendable (I : Set ℝ) (γ : ℝ → M) : Prop :=
  ∃ J γ', IntegralCurveExtension I J γ γ'

theorem IsRightExtendable.of_extension {I J : Set ℝ} {γ γ' : ℝ → M}
    (h : IntegralCurveExtension I J γ γ') :
    IsRightExtendable I γ := ⟨J, γ', h⟩

theorem IsLeftExtendable.of_extension {I J : Set ℝ} {γ γ' : ℝ → M}
    (h : IntegralCurveExtension I J γ γ') :
    IsLeftExtendable I γ := ⟨J, γ', h⟩

/- Candidate declarations for this file:
def compatibleOnOverlap ...
theorem gluable_of_compatibleOnOverlap ...
-/

end Blueprint

end UlamLib.ODE
