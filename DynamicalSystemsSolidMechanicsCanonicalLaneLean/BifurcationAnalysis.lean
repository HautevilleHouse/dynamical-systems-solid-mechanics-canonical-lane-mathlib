import DynamicalSystemsSolidMechanicsCanonicalLaneLean.PhaseSpaceStructure

/-!
# Bifurcation Analysis Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure BifurcationAnalysisPackage (D : DynamicalSystem) where
  parameterSpace : Type u
  equilibriumCurve : Prop
  bifurcationPoints : Prop
  normalForms : Prop
  stabilityChange : Prop
  bifurcationClosed : Prop

structure BifurcationAnalysisEvidence {D : DynamicalSystem} (B : BifurcationAnalysisPackage D) where
  equilibriumCurveClosed : B.equilibriumCurve
  bifurcationPointsClosed : B.bifurcationPoints
  stabilityChangeClosed : B.stabilityChange
  bifurcationClosedTerm : B.bifurcationClosed

def BifurcationAnalysisClosed {D : DynamicalSystem} (B : BifurcationAnalysisPackage D) : Prop :=
  B.equilibriumCurve ∧ B.bifurcationPoints ∧ B.stabilityChange ∧ B.bifurcationClosed

theorem bifurcation_analysis_closed_from_evidence
    {D : DynamicalSystem} (B : BifurcationAnalysisPackage D) (E : BifurcationAnalysisEvidence B) :
    BifurcationAnalysisClosed B := by
  exact And.intro E.equilibriumCurveClosed (And.intro E.bifurcationPointsClosed (And.intro E.stabilityChangeClosed E.bifurcationClosedTerm))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse