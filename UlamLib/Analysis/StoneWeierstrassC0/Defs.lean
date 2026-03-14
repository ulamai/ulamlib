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

theorem SeparatesPoints.monotone {A B : Set α} {eval : α → X → β}
    (hAB : A ⊆ B) :
    SeparatesPoints A eval → SeparatesPoints B eval := by
  intro hSep x y hxy
  rcases hSep hxy with ⟨f, hfA, hneq⟩
  exact ⟨f, hAB hfA, hneq⟩

/-- Generic nonvanishing predicate used to model future `C_0` APIs. -/
def VanishesNowhere [Zero β] (A : Set α) (eval : α → X → β) : Prop :=
  ∀ x : X, ∃ f ∈ A, eval f x ≠ 0

theorem VanishesNowhere.monotone [Zero β] {A B : Set α} {eval : α → X → β}
    (hAB : A ⊆ B) :
    VanishesNowhere A eval → VanishesNowhere B eval := by
  intro hNowhere x
  rcases hNowhere x with ⟨f, hfA, hne⟩
  exact ⟨f, hAB hfA, hne⟩

/- Candidate declarations for this file:
def SeparatesPointsC0 ...
def VanishesNowhereC0 ...
-/

end Blueprint

end UlamLib.Analysis.StoneWeierstrassC0
