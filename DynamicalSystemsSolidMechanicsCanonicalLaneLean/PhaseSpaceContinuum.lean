import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure PhaseSpaceContinuumPackage where
  positionField : Type
  velocityField : Type
  displacementField : Type
  strainTensor : Type
  stressTensor : Type
  constitutiveLaw : Prop
  evolutionOperator : Prop
  phaseSpaceSmooth : Prop
  phaseSpaceSmoothTerm : phaseSpaceSmooth

structure PhaseSpaceContinuumEvidence (P : PhaseSpaceContinuumPackage) where
  constitutiveLawClosed : P.constitutiveLaw
  evolutionOperatorClosed : P.evolutionOperator
  phaseSpaceSmoothClosed : P.phaseSpaceSmooth

def PhaseSpaceContinuumClosed (P : PhaseSpaceContinuumPackage) : Prop :=
  P.constitutiveLaw ∧ P.evolutionOperator ∧ P.phaseSpaceSmooth

theorem phase_space_continuum_closed_from_evidence (P : PhaseSpaceContinuumPackage)
    (E : PhaseSpaceContinuumEvidence P) : PhaseSpaceContinuumClosed P := by
  exact And.intro E.constitutiveLawClosed (And.intro E.evolutionOperatorClosed E.phaseSpaceSmoothClosed)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse
