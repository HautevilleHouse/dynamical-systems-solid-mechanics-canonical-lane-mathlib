import DynamicalSystemsSolidMechanicsCanonicalLaneLean.BifurcationAnalysis

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure FiniteElementDiscretizationPackage {C : ContinuousDynamicsPackage}
    {S : SolidMechanicsConstitutivePackage C} {St : StabilityAnalysisPackage S}
    {B : BifurcationAnalysisPackage St} where
  meshType : Type u
  shapeFunctionFamily : Type v
  convergenceProperty : Prop
  errorEstimate : Prop
  discreteStabilityPreserved : Prop

structure FiniteElementDiscretizationEvidence {C : ContinuousDynamicsPackage}
    {S : SolidMechanicsConstitutivePackage C} {St : StabilityAnalysisPackage S}
    {B : BifurcationAnalysisPackage St}
    (F : FiniteElementDiscretizationPackage B) where
  convergencePropertyClosed : F.convergenceProperty
  errorEstimateClosed : F.errorEstimate
  discreteStabilityPreservedClosed : F.discreteStabilityPreserved

def FiniteElementDiscretizationClosed {C : ContinuousDynamicsPackage}
    {S : SolidMechanicsConstitutivePackage C} {St : StabilityAnalysisPackage S}
    {B : BifurcationAnalysisPackage St}
    (F : FiniteElementDiscretizationPackage B) : Prop :=
  F.convergenceProperty ∧ F.errorEstimate ∧ F.discreteStabilityPreserved

theorem finite_element_discretization_closed_from_evidence
    {C : ContinuousDynamicsPackage} {S : SolidMechanicsConstitutivePackage C}
    {St : StabilityAnalysisPackage S} {B : BifurcationAnalysisPackage St}
    (F : FiniteElementDiscretizationPackage B) (E : FiniteElementDiscretizationEvidence F) :
    FiniteElementDiscretizationClosed F := by
  exact And.intro E.convergencePropertyClosed (And.intro E.errorEstimateClosed
    E.discreteStabilityPreservedClosed)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse