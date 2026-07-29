import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSolidMechanicsCanonicalLaneLean.FiniteElementDiscretization

/-!
# Time Integration Scheme Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure TimeIntegrationSchemePackage {P : SolidMechanicsPDEPackage}
    (F : FiniteElementDiscretizationPackage P) where
  newmarkBetaMethod : Prop
  stabilityCondition : Prop
  accuracyOrder : Prop
  energyConservation : Prop

structure TimeIntegrationSchemeEvidence {P : SolidMechanicsPDEPackage}
    {F : FiniteElementDiscretizationPackage P}
    (T : TimeIntegrationSchemePackage F) where
  newmarkBetaMethodClosed : T.newmarkBetaMethod
  stabilityConditionClosed : T.stabilityCondition
  accuracyOrderClosed : T.accuracyOrder
  energyConservationClosed : T.energyConservation

def TimeIntegrationSchemeClosed {P : SolidMechanicsPDEPackage}
    {F : FiniteElementDiscretizationPackage P}
    (T : TimeIntegrationSchemePackage F) : Prop :=
  T.newmarkBetaMethod ∧ T.stabilityCondition ∧ T.accuracyOrder ∧ T.energyConservation

theorem time_integration_scheme_closed_from_evidence
    {P : SolidMechanicsPDEPackage} {F : FiniteElementDiscretizationPackage P}
    (T : TimeIntegrationSchemePackage F) (E : TimeIntegrationSchemeEvidence T) :
    TimeIntegrationSchemeClosed T := by
  exact And.intro E.newmarkBetaMethodClosed
    (And.intro E.stabilityConditionClosed
      (And.intro E.accuracyOrderClosed E.energyConservationClosed))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse