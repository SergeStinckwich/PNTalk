parsing transition
optGuard

	| actions guards complexGuard isQueue |
	(alex isReserved: #guard) ifFalse: [^nil].

	self expectedReserved: #guard.

	actions := self codeBody.
"	guards := actions collect: [ :action || g | g := action as: PNCompiledGuard. g compile. g ]."
	
	isQueue := false.
	guards := OrderedCollection new.
	actions do: [ :action || g | 
		g := action as: PNCompiledGuard. g compile. 
		action usesQueue 
			ifTrue: [
				isQueue ifFalse: [ complexGuard := PNCompiledGuardComplex new. isQueue := true. ].
				complexGuard add: g.
			]
			ifFalse: [
				isQueue 
					ifTrue: [ complexGuard add: g. isQueue := false. guards addLast: complexGuard. complexGuard := nil. ]
					ifFalse: [ guards addLast: g. ].
			].
	].

	^ guards.