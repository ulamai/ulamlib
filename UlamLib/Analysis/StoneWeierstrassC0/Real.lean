import UlamLib.Analysis.StoneWeierstrassC0.Lattice

/-!
# `StoneWeierstrassC0.Real`

Starter theorem cluster for the real-valued `C_0` Stone-Weierstrass track.
-/

namespace UlamLib.Analysis.StoneWeierstrassC0

section Blueprint

variable {X : Type*} [TopologicalSpace X]
variable {α : Type*}
variable {A B : Set α}
variable {eval : α → X → ℝ}

theorem SeparatesPoints.union_left (hSep : SeparatesPoints A eval) :
    SeparatesPoints (A ∪ B) eval :=
  (SeparatesPoints.monotone
    (A := A)
    (B := A ∪ B)
    (eval := eval)
    (by
      intro f hf
      exact Or.inl hf)) hSep

theorem VanishesNowhere.union_left (hNowhere : VanishesNowhere A eval) :
    VanishesNowhere (A ∪ B) eval :=
  (VanishesNowhere.monotone
    (A := A)
    (B := A ∪ B)
    (eval := eval)
    (by
      intro f hf
      exact Or.inl hf)) hNowhere

/--
A tiny completed theorem cluster for the showcase track: if one family already
separates points and vanishes nowhere, adjoining extra functions preserves both
properties.
-/
theorem starterCluster_union_left
    (hSep : SeparatesPoints A eval)
    (hNowhere : VanishesNowhere A eval) :
    SeparatesPoints (A ∪ B) eval ∧ VanishesNowhere (A ∪ B) eval := by
  exact
    ⟨SeparatesPoints.union_left (A := A) (B := B) (eval := eval) hSep,
      VanishesNowhere.union_left (A := A) (B := B) (eval := eval) hNowhere⟩

/- Candidate declarations for this file:
theorem stoneWeierstrass_C0_real ...
theorem compactSupport_approximation ...
-/

end Blueprint

end UlamLib.Analysis.StoneWeierstrassC0
