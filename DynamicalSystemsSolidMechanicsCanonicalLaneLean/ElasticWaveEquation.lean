import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSolidMechanicsCanonicalLaneLean.PhaseSpaceContinuum

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure ElasticWaveEquationPackage {P : PhaseSpaceContinuumPackage} where
  waveSpeed : ℝ
  laméParameters : ℝ × ℝ
  waveEquationSolved : Prop
  dispersionRelation : Prop
  waveEquationSolvedTerm : waveEquationSolved
  dispersionRelationTerm : dispersionRelation

structure ElasticWaveEquationEvidence {P : PhaseSpaceContinuumPackage}
    (E : ElasticWaveEquationPackage P) where
  waveEquationSolvedClosed : E.waveEquationSolved
  dispersionRelationClosed : E.dispersionRelation

def ElasticWaveEquationClosed {P : PhaseSpaceContinuumPackage}
    (E : ElasticWaveEquationPackage P) : Prop :=
  E.waveEquationSolved ∧ E.dispersionRelation

theorem elastic_wave_equation_closed_from_evidence
    {P : PhaseSpaceContinuumPackage} (E : ElasticWaveEquationPackage P)
    (Ev : ElasticWaveEquationEvidence E) : ElasticWaveEquationClosed E := by
  exact And.intro Ev.waveEquationSolvedClosed Ev.dispersionRelationClosed

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse
