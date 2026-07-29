import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure ModalAnalysisPackage where
  massMatrix : SquareMatrix n ℝ
  stiffnessMatrix : SquareMatrix n ℝ
  dampingMatrix : SquareMatrix n ℝ
  eigenfrequencies : Vector n ℝ
  modeShapes : Matrix n n ℝ
  orthogonalityCondition : Prop
  normalizationCondition : Prop

structure ModalAnalysisEvidence (M : ModalAnalysisPackage) where
  massMatrixPositiveDefinite : M.massMatrix > 0
  stiffnessMatrixPositiveSemidefinite : M.stiffnessMatrix ≥ 0
  eigenEquationHolds : M.stiffnessMatrix • M.modeShapes = M.massMatrix • M.modeShapes • diag M.eigenfrequencies^2
  orthogonalityConditionClosed : M.orthogonalityCondition
  normalizationConditionClosed : M.normalizationCondition

def ModalAnalysisClosed (M : ModalAnalysisPackage) : Prop :=
  M.massMatrix > 0 ∧ M.stiffnessMatrix ≥ 0 ∧
  (M.stiffnessMatrix • M.modeShapes = M.massMatrix • M.modeShapes • diag M.eigenfrequencies^2) ∧
  M.orthogonalityCondition ∧ M.normalizationCondition

theorem modal_analysis_closed_from_evidence
    (M : ModalAnalysisPackage) (ev : ModalAnalysisEvidence M) :
    ModalAnalysisClosed M := by
  exact And.intro ev.massMatrixPositiveDefinite
    (And.intro ev.stiffnessMatrixPositiveSemidefinite
      (And.intro ev.eigenEquationHolds
        (And.intro ev.orthogonalityConditionClosed ev.normalizationConditionClosed)))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse