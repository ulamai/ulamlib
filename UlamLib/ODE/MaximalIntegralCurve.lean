import UlamLib.ODE.Extendability

/-!
# `MaximalIntegralCurve`

Scaffold for maximal integral curves on the boundaryless or interior-point
scope.
-/

namespace UlamLib.ODE

section Blueprint

variable {M : Type*}

/-- A bundled curve equipped with a maximal time domain. -/
structure MaximalIntegralCurve where
  domain : Set ℝ
  curve : ℝ → M
  isOpen_domain : IsOpen domain
  maximality :
    ∀ {J : Set ℝ} {γ' : ℝ → M},
      IntegralCurveExtension domain J curve γ' → J ⊆ domain

/- Candidate declarations for this file:
theorem maximalCurve_unique ...
theorem maximalCurve_eq_on_overlap ...
-/

end Blueprint

end UlamLib.ODE
