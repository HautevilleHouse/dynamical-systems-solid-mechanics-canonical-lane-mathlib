import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsCanonicalLaneLean

structure StabilityAnalysisPackage where
  equilibriumPoint : Type u
  perturbedFlow : Type v
  lyapunovFunction : Type w
  equilibriumExists : Prop
  flowDefined : Prop
  lyapunovFunctionDefined : Prop
  positiveDefiniteLyapunov : Prop
  derivativeNegativeSemidefinite : Prop
  asymptoticStabilityConcluded : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  equilibriumExistsClosed : S.equilibriumExists
  flowDefinedClosed : S.flowDefined
  lyapunovFunctionDefinedClosed : S.lyapunovFunctionDefined
  positiveDefiniteLyapunovClosed : S.positiveDefiniteLyapunov
  derivativeNegativeSemidefiniteClosed : S.derivativeNegativeSemidefinite
  asymptoticStabilityConcludedClosed : S.asymptoticStabilityConcluded

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.equilibriumExists ∧ S.flowDefined ∧ S.lyapunovFunctionDefined ∧
  S.positiveDefiniteLyapunov ∧ S.derivativeNegativeSemidefinite ∧
  S.asymptoticStabilityConcluded

theorem stability_analysis_closed_from_evidence (S : StabilityAnalysisPackage) (E : StabilityAnalysisEvidence S) :
    StabilityAnalysisClosed S := by
  exact And.intro E.equilibriumExistsClosed
    (And.intro E.flowDefinedClosed
      (And.intro E.lyapunovFunctionDefinedClosed
        (And.intro E.positiveDefiniteLyapunovClosed
          (And.intro E.derivativeNegativeSemidefiniteClosed
            E.asymptoticStabilityConcludedClosed))))

end DynamicalSystemsSolidMechanicsCanonicalLaneLean
end HautevilleHouse
