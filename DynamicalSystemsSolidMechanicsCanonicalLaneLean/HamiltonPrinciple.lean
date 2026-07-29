import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure HamiltonPrinciplePackage where
  lagrangian : ℝ → ℝ → ℝ   -- function of position and velocity
  actionFunctional : (ℝ → ℝ) → ℝ
  equationsOfMotion : (ℝ → ℝ) → ℝ → Prop
  stationaryActionCondition : Prop
  variationalDerivation : Prop

structure HamiltonPrincipleEvidence (H : HamiltonPrinciplePackage) where
  actionDefinedAsIntegral : H.actionFunctional = λ q => ∫ t, H.lagrangian (q t) (derivative q t) dt
  stationaryActionConditionClosed : H.stationaryActionCondition
  variationalDerivationClosed : H.variationalDerivation
  eulerLagrangeEquivalence : H.equationsOfMotion = eulerLagrange H.lagrangian

def HamiltonPrincipleClosed (H : HamiltonPrinciplePackage) : Prop :=
  H.actionFunctional = (λ q => ∫ t, H.lagrangian (q t) (derivative q t) dt) ∧
  H.stationaryActionCondition ∧ H.variationalDerivation ∧
  H.equationsOfMotion = eulerLagrange H.lagrangian

theorem hamilton_principle_closed_from_evidence
    (H : HamiltonPrinciplePackage) (ev : HamiltonPrincipleEvidence H) :
    HamiltonPrincipleClosed H := by
  exact And.intro ev.actionDefinedAsIntegral
    (And.intro ev.stationaryActionConditionClosed
      (And.intro ev.variationalDerivationClosed ev.eulerLagrangeEquivalence))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse