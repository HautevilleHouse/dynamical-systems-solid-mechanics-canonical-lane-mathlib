import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure ElasticityContinuumPackage where
  referenceConfiguration : Type u
  currentConfiguration : Type u
  deformationMap : referenceConfiguration → currentConfiguration
  displacementField : referenceConfiguration → EuclideanVector
  strainTensor : referenceConfiguration → SymmetricTensor
  stressTensor : referenceConfiguration → SymmetricTensor
  constitutiveLaw : referenceConfiguration → Prop
  linearElasticAssumption : Prop
  smallStrainRegime : Prop

structure ElasticityContinuumEvidence (E : ElasticityContinuumPackage) where
  deformationMapSmooth : E.deformationMap ∈ C^∞
  strainFromDisplacement : E.strainTensor = gradSym E.displacementField
  stressStrainRelation : E.stressTensor = E.constitutiveLaw • E.strainTensor
  linearElasticAssumptionClosed : E.linearElasticAssumption
  smallStrainRegimeClosed : E.smallStrainRegime

def ElasticityContinuumClosed (E : ElasticityContinuumPackage) : Prop :=
  E.deformationMap ∈ C^∞ ∧ E.strainTensor = gradSym E.displacementField ∧
  E.stressTensor = E.constitutiveLaw • E.strainTensor ∧
  E.linearElasticAssumption ∧ E.smallStrainRegime

theorem elasticity_continuum_closed_from_evidence
    (E : ElasticityContinuumPackage) (ev : ElasticityContinuumEvidence E) :
    ElasticityContinuumClosed E := by
  exact And.intro ev.deformationMapSmooth
    (And.intro ev.strainFromDisplacement
      (And.intro ev.stressStrainRelation
        (And.intro ev.linearElasticAssumptionClosed ev.smallStrainRegimeClosed)))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse