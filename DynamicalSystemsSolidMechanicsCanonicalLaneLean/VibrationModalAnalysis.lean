import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSolidMechanicsCanonicalLaneLean.SolidMechanicsPDE

/-!
# Vibration Modal Analysis Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure VibrationModalAnalysisPackage (P : SolidMechanicsPDEPackage) where
  eigenvalueProblem : Prop
  modeShapeBasis : Prop
  orthogonality : Prop
  frequencySpectrum : Prop
  dampingModel : Prop

structure VibrationModalAnalysisEvidence {P : SolidMechanicsPDEPackage}
    (V : VibrationModalAnalysisPackage P) where
  eigenvalueProblemClosed : V.eigenvalueProblem
  modeShapeBasisClosed : V.modeShapeBasis
  orthogonalityClosed : V.orthogonality
  frequencySpectrumClosed : V.frequencySpectrum
  dampingModelClosed : V.dampingModel

def VibrationModalAnalysisClosed {P : SolidMechanicsPDEPackage}
    (V : VibrationModalAnalysisPackage P) : Prop :=
  V.eigenvalueProblem ∧ V.modeShapeBasis ∧ V.orthogonality ∧
  V.frequencySpectrum ∧ V.dampingModel

theorem vibration_modal_analysis_closed_from_evidence
    {P : SolidMechanicsPDEPackage} (V : VibrationModalAnalysisPackage P)
    (E : VibrationModalAnalysisEvidence V) : VibrationModalAnalysisClosed V := by
  exact And.intro E.eigenvalueProblemClosed
    (And.intro E.modeShapeBasisClosed
      (And.intro E.orthogonalityClosed
        (And.intro E.frequencySpectrumClosed E.dampingModelClosed)))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse