import Mathlib.Topology.ContinuousMap.StoneWeierstrass

/-!
# `StoneWeierstrassC0.Defs`

Scaffold for the definitional layer of `notes/StoneWeierstrassC0.tex`.
-/

namespace UlamLib.Analysis.StoneWeierstrassC0

section Blueprint

variable {X : Type*} [TopologicalSpace X]
variable {α : Type*} {β : Type*}

/-- Generic separation predicate used to model future `C_0` APIs. -/
def SeparatesPoints (A : Set α) (eval : α → X → β) : Prop :=
  ∀ ⦃x y : X⦄, x ≠ y → ∃ f ∈ A, eval f x ≠ eval f y

/-- Generic nonvanishing predicate used to model future `C_0` APIs. -/
def VanishesNowhere [Zero β] (A : Set α) (eval : α → X → β) : Prop :=
  ∀ x : X, ∃ f ∈ A, eval f x ≠ 0

/- Candidate declarations for this file:
def SeparatesPointsC0 ...
def VanishesNowhereC0 ...
-/

end Blueprint

end UlamLib.Analysis.StoneWeierstrassC0
