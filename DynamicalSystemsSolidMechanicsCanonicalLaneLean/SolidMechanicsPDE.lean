import canonicalLaneMathlib.AdmissibleClass

/-!
# Solid Mechanics PDE Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure SolidMechanicsPDEPackage where
  displacementField : Type u
  stressTensor : Type v
  strainTensor : Type w
  constitutiveLaw : Prop
  equilibriumEquation : Prop
  boundaryConditions : Prop

structure SolidMechanicsPDEEvidence (P : SolidMechanicsPDEPackage) where
  constitutiveLawClosed : P.constitutiveLaw
  equilibriumEquationClosed : P.equilibriumEquation
  boundaryConditionsClosed : P.boundaryConditions

def SolidMechanicsPDEClosed (P : SolidMechanicsPDEPackage) : Prop :=
  P.constitutiveLaw ∧ P.equilibriumEquation ∧ P.boundaryConditions

theorem solid_mechanics_pde_closed_from_evidence
    (P : SolidMechanicsPDEPackage) (E : SolidMechanicsPDEEvidence P) :
    SolidMechanicsPDEClosed P := by
  exact And.intro E.constitutiveLawClosed
    (And.intro E.equilibriumEquationClosed E.boundaryConditionsClosed)

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse