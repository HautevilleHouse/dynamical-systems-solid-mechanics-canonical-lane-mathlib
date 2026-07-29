import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure VibratingStringPDEPackage where
  stringLength : ℝ
  waveSpeed : ℝ
  initialDisplacement : ℝ → ℝ
  initialVelocity : ℝ → ℝ
  boundaryFixed : Prop
  solutionDefined : ℝ × ℝ → ℝ
  waveEquationHolds : Prop

structure VibratingStringPDEEvidence (V : VibratingStringPDEPackage) where
  waveSpeedPositive : V.waveSpeed > 0
  initialDisplacementSmooth : V.initialDisplacement ∈ C^∞
  initialVelocitySmooth : V.initialVelocity ∈ C^∞
  boundaryFixedClosed : V.boundaryFixed
  waveEquationHoldsClosed : V.waveEquationHolds

def VibratingStringPDEClosed (V : VibratingStringPDEPackage) : Prop :=
  V.waveSpeed > 0 ∧ V.initialDisplacement ∈ C^∞ ∧ V.initialVelocity ∈ C^∞ ∧
  V.boundaryFixed ∧ V.waveEquationHolds

theorem vibrating_string_pde_closed_from_evidence
    (V : VibratingStringPDEPackage) (ev : VibratingStringPDEEvidence V) :
    VibratingStringPDEClosed V := by
  exact And.intro ev.waveSpeedPositive
    (And.intro ev.initialDisplacementSmooth
      (And.intro ev.initialVelocitySmooth
        (And.intro ev.boundaryFixedClosed ev.waveEquationHoldsClosed)))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse