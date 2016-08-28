instance creation
newIn: aTransition for: aGuardGoal

	| act |
"	act := PNTransGoalGuard newIn: aTransition."
	act := PNTransGoalGuard newIn: aGuardGoal.
"
	act expr: (compiledAction copy).
	act fireExpression: (fireAction copy).
"
	act expr: (Compiler evaluate: compiledAction for: aGuardGoal logged: false).
	act fireExpression: (Compiler evaluate: fireAction for: aGuardGoal logged: false).

	act postAction: (Compiler evaluate: compiledPostAction for: aGuardGoal logged: false).

"	act action: compiledAction.
	act postAction: compiledPostAction.
"
	^act.
