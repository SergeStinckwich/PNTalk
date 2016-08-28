event handling
morphNamed: aMorphName

	| morph |
	morph := self transNamed: aMorphName.
	^ morph isNil
		ifTrue: [ self portNamed: aMorphName ]
		ifFalse: [ morph ]. 
