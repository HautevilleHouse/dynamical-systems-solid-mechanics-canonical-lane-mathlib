import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSolidMechanicsCanonicalLaneLean.SolidMechanicsPDE

/-!
# Hyperelastic Strain Energy Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure HyperelasticStrainEnergyPackage (P : SolidMechanicsPDEPackage) where
  energyFunctional : Type u
  polyconvexity : Prop
  coercivity : Prop
  growthCondition : Prop
  existenceOfMinimizer : Prop

structure HyperelasticStrainEnergyEvidence {P : SolidMechanicsPDEPackage}
    (H : HyperelasticStrainEnergyPackage P) where
  polyconvexityClosed : H.polyconvexity
  coercivityClosed : H.coercivity
  growthConditionClosed : H.growthCondition
  existenceOfMinimizerClosed : H.existenceOfMinimizer

def HyperelasticStrainEnergyClosed {P : SolidMechanicsPDEPackage}
    (H : HyperelasticStrainEnergyPackage P) : Prop :=
  H.polyconvexity ∧ H.coercivity ∧ H.growthCondition ∧ H.existenceOfMinimizer

theorem hyperelastic_strain_energy_closed_from_evidence
    {P : SolidMechanicsPDEPackage} (H : HyperelasticStrainEnergyPackage P)
    (E : HyperelasticStrainEnergyEvidence H) : HyperelasticStrainEnergyClosed H := by
  exact And.intro E.polyconvexityClosed
    (And.intro E.coercivityClosed
      (And.intro E.growthConditionClosed E.existenceOfMinimizerClosed))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse