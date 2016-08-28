instance creation
newIn: aTransition

	| act |
	act := PNTransGoalGuard newIn: aTransition.

"
	act expr: (compiledAction copy).
	act fireExpression: (fireAction copy).
"
	act expr: (Compiler evaluate: compiledAction for: act logged: false).
	act fireExpression: (Compiler evaluate: fireAction for: act logged: false).

"	act postAction: (Compiler evaluate: compiledPostAction for: act logged: false)."

"	act action: compiledAction.
	act postAction: compiledPostAction.
"
	^act.
