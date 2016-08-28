instance creation
newIn: aTransition

	| act |
	act := PNAction newIn: aTransition.
"
	act action: (compiledAction copy).
	act postAction: (compiledPostAction copy).
"
	act action: (Compiler evaluate: compiledAction for: act logged: false).
	act postAction: (Compiler evaluate: compiledPostAction for: act logged: false).
	^act.
