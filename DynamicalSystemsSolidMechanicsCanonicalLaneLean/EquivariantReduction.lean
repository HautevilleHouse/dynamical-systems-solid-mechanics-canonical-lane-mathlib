import DynamicalSystemsSolidMechanicsCanonicalLaneLean.PhaseSpaceStructure

/-!
# Equivariant Reduction Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure EquivariantReductionPackage (Φ : PhaseSpace) where
  symmetryGroup : Type u
  groupAction : Prop
  momentumMap : Prop
  reducedPhaseSpace : PhaseSpace
  reductionDimension : Prop
  reducedDynamicsConsistent : Prop
  reductionClosed : Prop

structure EquivariantReductionEvidence {Φ : PhaseSpace} (R : EquivariantReductionPackage Φ) where
  reductionDimensionClosed : R.reductionDimension
  reducedDynamicsConsistentClosed : R.reducedDynamicsConsistent
  reductionClosedTerm : R.reductionClosed

def EquivariantReductionClosed {Φ : PhaseSpace} (R : EquivariantReductionPackage Φ) : Prop :=
  R.reductionDimension ∧ R.reducedDynamicsConsistent ∧ R.reductionClosed

theorem equivariant_reduction_closed_from_evidence
    {Φ : PhaseSpace} (R : EquivariantReductionPackage Φ) (E : EquivariantReductionEvidence R) :
    EquivariantReductionClosed R := by
  exact And.intro E.reductionDimensionClosed (And.intro E.reducedDynamicsConsistentClosed E.reductionClosedTerm)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse