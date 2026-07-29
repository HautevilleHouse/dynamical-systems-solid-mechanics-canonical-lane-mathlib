import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure HamiltonianDynamicsPackage where
  phaseSpace : Type u
  topology : TopologicalSpace phaseSpace
  symplecticForm : Type v
  hamiltonian : Type w
  phaseSpaceSmooth : Prop
  symplecticNondegenerate : Prop
  hamiltonianSmooth : Prop
  hamiltonianVectorFieldDefined : Prop
  flowPreservesSymplecticForm : Prop
  energyConservation : Prop

structure HamiltonianDynamicsEvidence (H : HamiltonianDynamicsPackage) where
  phaseSpaceSmoothClosed : H.phaseSpaceSmooth
  symplecticNondegenerateClosed : H.symplecticNondegenerate
  hamiltonianSmoothClosed : H.hamiltonianSmooth
  hamiltonianVectorFieldDefinedClosed : H.hamiltonianVectorFieldDefined
  flowPreservesSymplecticFormClosed : H.flowPreservesSymplecticForm
  energyConservationClosed : H.energyConservation

def HamiltonianDynamicsClosed (H : HamiltonianDynamicsPackage) : Prop :=
  H.phaseSpaceSmooth ∧ H.symplecticNondegenerate ∧ H.hamiltonianSmooth ∧
  H.hamiltonianVectorFieldDefined ∧ H.flowPreservesSymplecticForm ∧
  H.energyConservation

theorem hamiltonian_dynamics_closed_from_evidence (H : HamiltonianDynamicsPackage) (E : HamiltonianDynamicsEvidence H) :
    HamiltonianDynamicsClosed H := by
  exact And.intro E.phaseSpaceSmoothClosed
    (And.intro E.symplecticNondegenerateClosed
      (And.intro E.hamiltonianSmoothClosed
        (And.intro E.hamiltonianVectorFieldDefinedClosed
          (And.intro E.flowPreservesSymplecticFormClosed
            E.energyConservationClosed))))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse
