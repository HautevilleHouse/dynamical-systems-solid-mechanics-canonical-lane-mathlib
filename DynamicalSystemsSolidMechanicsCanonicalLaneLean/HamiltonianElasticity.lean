import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSolidMechanicsCanonicalLaneLean.ElasticWaveEquation

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure HamiltonianElasticityPackage {P : PhaseSpaceContinuumPackage}
    {E : ElasticWaveEquationPackage P} where
  hamiltonianFunctional : ℝ
  poissonBracketStructure : Prop
  energyConservation : Prop
  hamiltonianFunctionalTerm : hamiltonianFunctional
  poissonBracketStructureTerm : poissonBracketStructure
  energyConservationTerm : energyConservation

structure HamiltonianElasticityEvidence {P : PhaseSpaceContinuumPackage}
    {E : ElasticWaveEquationPackage P} (H : HamiltonianElasticityPackage P E) where
  poissonBracketStructureClosed : H.poissonBracketStructure
  energyConservationClosed : H.energyConservation

def HamiltonianElasticityClosed {P : PhaseSpaceContinuumPackage}
    {E : ElasticWaveEquationPackage P} (H : HamiltonianElasticityPackage P E) : Prop :=
  H.poissonBracketStructure ∧ H.energyConservation

theorem hamiltonian_elasticity_closed_from_evidence
    {P : PhaseSpaceContinuumPackage} {E : ElasticWaveEquationPackage P}
    (H : HamiltonianElasticityPackage P E) (Ev : HamiltonianElasticityEvidence H) :
    HamiltonianElasticityClosed H := by
  exact And.intro Ev.poissonBracketStructureClosed Ev.energyConservationClosed

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse
