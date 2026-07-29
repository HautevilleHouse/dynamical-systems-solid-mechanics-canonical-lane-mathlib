import DynamicalSystemsSolidMechanicsCanonicalLaneLean.SolidMechanicsConstitutive

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure StabilityAnalysisPackage {C : ContinuousDynamicsPackage}
    {S : SolidMechanicsConstitutivePackage C} where
  equilibriumPoint : Type u
  lyapunovFunction : Type v
  stabilityCondition : Prop
  asymptoticStabilityCondition : Prop
  basinOfAttraction : Prop

structure StabilityAnalysisEvidence {C : ContinuousDynamicsPackage}
    {S : SolidMechanicsConstitutivePackage C} (St : StabilityAnalysisPackage S) where
  stabilityConditionClosed : St.stabilityCondition
  asymptoticStabilityConditionClosed : St.asymptoticStabilityCondition
  basinOfAttractionClosed : St.basinOfAttraction

def StabilityAnalysisClosed {C : ContinuousDynamicsPackage}
    {S : SolidMechanicsConstitutivePackage C} (St : StabilityAnalysisPackage S) : Prop :=
  St.stabilityCondition ∧ St.asymptoticStabilityCondition ∧ St.basinOfAttraction

theorem stability_analysis_closed_from_evidence
    {C : ContinuousDynamicsPackage} {S : SolidMechanicsConstitutivePackage C}
    (St : StabilityAnalysisPackage S) (E : StabilityAnalysisEvidence St) :
    StabilityAnalysisClosed St := by
  exact And.intro E.stabilityConditionClosed (And.intro E.asymptoticStabilityConditionClosed
    E.basinOfAttractionClosed)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse