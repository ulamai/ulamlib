import UlamLib.Analysis.StoneWeierstrassC0.Defs

/-!
# `StoneWeierstrassC0.Lattice`

Starter lattice scaffolding for the real-valued `C_0` track.
-/

namespace UlamLib.Analysis.StoneWeierstrassC0

section Blueprint

variable {X : Type*}

/-- Pointwise closure under absolute value. -/
def ClosedUnderAbs (A : Set (X → ℝ)) : Prop :=
  ∀ ⦃f : X → ℝ⦄, f ∈ A → (fun x => |f x|) ∈ A

/-- Pointwise closure under supremum. -/
def ClosedUnderSup (A : Set (X → ℝ)) : Prop :=
  ∀ ⦃f g : X → ℝ⦄, f ∈ A → g ∈ A → (fun x => max (f x) (g x)) ∈ A

/-- Pointwise closure under infimum. -/
def ClosedUnderInf (A : Set (X → ℝ)) : Prop :=
  ∀ ⦃f g : X → ℝ⦄, f ∈ A → g ∈ A → (fun x => min (f x) (g x)) ∈ A

theorem ClosedUnderAbs.abs_mem {A : Set (X → ℝ)} (hA : ClosedUnderAbs A)
    {f : X → ℝ} (hf : f ∈ A) :
    (fun x => |f x|) ∈ A :=
  hA hf

theorem ClosedUnderSup.sup_mem {A : Set (X → ℝ)} (hA : ClosedUnderSup A)
    {f g : X → ℝ} (hf : f ∈ A) (hg : g ∈ A) :
    (fun x => max (f x) (g x)) ∈ A :=
  hA hf hg

theorem ClosedUnderInf.inf_mem {A : Set (X → ℝ)} (hA : ClosedUnderInf A)
    {f g : X → ℝ} (hf : f ∈ A) (hg : g ∈ A) :
    (fun x => min (f x) (g x)) ∈ A :=
  hA hf hg

theorem closedUnderAbs_univ : ClosedUnderAbs (Set.univ : Set (X → ℝ)) := by
  intro f hf
  simp

theorem closedUnderSup_univ : ClosedUnderSup (Set.univ : Set (X → ℝ)) := by
  intro f g hf hg
  simp

theorem closedUnderInf_univ : ClosedUnderInf (Set.univ : Set (X → ℝ)) := by
  intro f g hf hg
  simp

/- Candidate declarations for this file:
theorem closedUnderAbs_sup_inf ...
theorem closedSublattice_of_absClosed ...
-/

end Blueprint

end UlamLib.Analysis.StoneWeierstrassC0
