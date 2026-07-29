import DynamicalSystemsSolidMechanicsCanonicalLaneLean.ContinuousDynamics

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure SolidMechanicsConstitutivePackage {C : ContinuousDynamicsPackage} where
  strainMeasure : Type u
  stressMeasure : Type v
  constitutiveLaw : Prop
  hyperelasticPotential : Prop
  materialFrameIndifference : Prop

structure SolidMechanicsConstitutiveEvidence {C : ContinuousDynamicsPackage}
    (S : SolidMechanicsConstitutivePackage C) where
  constitutiveLawClosed : S.constitutiveLaw
  hyperelasticPotentialClosed : S.hyperelasticPotential
  materialFrameIndifferenceClosed : S.materialFrameIndifference

def SolidMechanicsConstitutiveClosed {C : ContinuousDynamicsPackage}
    (S : SolidMechanicsConstitutivePackage C) : Prop :=
  S.constitutiveLaw ∧ S.hyperelasticPotential ∧ S.materialFrameIndifference

theorem solid_mechanics_constitutive_closed_from_evidence
    {C : ContinuousDynamicsPackage} (S : SolidMechanicsConstitutivePackage C)
    (E : SolidMechanicsConstitutiveEvidence S) : SolidMechanicsConstitutiveClosed S := by
  exact And.intro E.constitutiveLawClosed (And.intro E.hyperelasticPotentialClosed
    E.materialFrameIndifferenceClosed)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse