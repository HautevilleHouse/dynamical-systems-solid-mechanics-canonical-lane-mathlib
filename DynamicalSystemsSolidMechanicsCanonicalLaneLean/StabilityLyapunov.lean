import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure StabilityLyapunovPackage where
  phaseSpace : Type u
  vectorField : phaseSpace → phaseSpace
  equilibriumPoint : phaseSpace
  lyapunovFunction : phaseSpace → ℝ
  positiveDefiniteCondition : Prop
  derivativeNegativeCondition : Prop
  domainOfAttraction : Set phaseSpace

structure StabilityLyapunovEvidence (S : StabilityLyapunovPackage) where
  lyapunovFunctionPositiveDefinite : ∀ x ≠ S.equilibriumPoint, S.lyapunovFunction x > 0
  lyapunovFunctionZeroAtEquilibrium : S.lyapunovFunction S.equilibriumPoint = 0
  derivativeSemiNegativeDefinite : ∀ x, directionalDerivative S.vectorField S.lyapunovFunction x ≤ 0
  equilibriumFixedPoint : S.vectorField S.equilibriumPoint = S.equilibriumPoint

def StabilityLyapunovClosed (S : StabilityLyapunovPackage) : Prop :=
  (∀ x ≠ S.equilibriumPoint, S.lyapunovFunction x > 0) ∧
  S.lyapunovFunction S.equilibriumPoint = 0 ∧
  (∀ x, directionalDerivative S.vectorField S.lyapunovFunction x ≤ 0) ∧
  S.vectorField S.equilibriumPoint = S.equilibriumPoint

theorem stability_lyapunov_closed_from_evidence
    (S : StabilityLyapunovPackage) (ev : StabilityLyapunovEvidence S) :
    StabilityLyapunovClosed S := by
  exact And.intro ev.lyapunovFunctionPositiveDefinite
    (And.intro ev.lyapunovFunctionZeroAtEquilibrium
      (And.intro ev.derivativeSemiNegativeDefinite ev.equilibriumFixedPoint))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse