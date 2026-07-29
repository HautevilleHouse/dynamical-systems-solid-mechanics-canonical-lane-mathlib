import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSolidMechanicsCanonicalLaneLean.PhaseSpaceStructure

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicalSystemClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse