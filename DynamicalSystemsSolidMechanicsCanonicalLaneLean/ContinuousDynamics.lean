import DynamicalSystemsSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure ContinuousDynamicsPackage where
  trajectorySpace : Type u
  timeDomain : Type v
  flowMap : timeDomain → trajectorySpace → trajectorySpace
  flowProperty : Prop
  invariantSets : Prop
  attractorExistence : Prop

structure ContinuousDynamicsEvidence (C : ContinuousDynamicsPackage) where
  flowPropertyClosed : C.flowProperty
  invariantSetsClosed : C.invariantSets
  attractorExistenceClosed : C.attractorExistence

def ContinuousDynamicsClosed (C : ContinuousDynamicsPackage) : Prop :=
  C.flowProperty ∧ C.invariantSets ∧ C.attractorExistence

theorem continuous_dynamics_closed_from_evidence (C : ContinuousDynamicsPackage)
    (E : ContinuousDynamicsEvidence C) : ContinuousDynamicsClosed C := by
  exact And.intro E.flowPropertyClosed (And.intro E.invariantSetsClosed E.attractorExistenceClosed)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse