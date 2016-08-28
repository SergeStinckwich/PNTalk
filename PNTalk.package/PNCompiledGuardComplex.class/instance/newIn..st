as yet unclassified
newIn: aTransition

	| act |

	act := PNTransGoalGuardComplex newIn: aTransition.
	
	actions do: [:a | a newIn: aTransition for: act. ].

	^act.