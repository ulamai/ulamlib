import Mathlib.LinearAlgebra.Matrix

/-!
# `RowOp`

Blueprint scaffold for the row-operation layer from `notes/RowReduction.tex`.
-/

namespace UlamLib.LinearAlgebra

universe u v

/-- Elementary row operations on a matrix with row index type `m`. -/
inductive RowOp (K : Type u) (m : Type v) where
  | swap (i j : m)
  | scale (i : m) (c : Kˣ)
  | shear (src dst : m) (c : K)

namespace RowOp

variable {K : Type u} [Semiring K] {m : Type v} [DecidableEq m]

/-- Candidate action of a row operation on a matrix. -/
def apply {n : Type*} (op : RowOp K m) (A : Matrix m n K) : Matrix m n K :=
  match op with
  | .swap i j =>
      fun r c => if r = i then A j c else if r = j then A i c else A r c
  | .scale i u =>
      fun r c => if r = i then (u : K) * A r c else A r c
  | .shear src dst a =>
      fun r c => if r = dst then A dst c + a * A src c else A r c

/-- Replay a list of row operations from left to right. -/
def applyList {n : Type*} (ops : List (RowOp K m)) (A : Matrix m n K) :
    Matrix m n K :=
  ops.foldl (fun B op => op.apply B) A

end RowOp

end UlamLib.LinearAlgebra
