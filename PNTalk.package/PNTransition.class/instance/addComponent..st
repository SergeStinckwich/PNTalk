accessing
addComponent: aComponent

	(aComponent isThread)
		ifTrue: [ ^ super addComponent: aComponent ].
"		ifTrue: [ ^ threads at: (aComponent id) put: aComponent ]."
	aComponent parent: self.
	(aComponent isPreCondition | aComponent isCondition)
		ifTrue: [ ^ self addArcGoal: aComponent ].
	(aComponent isPostCondition)
		ifTrue: [ ^ self addPostArcGoal: aComponent ].
	(aComponent isGuard)
		ifTrue: [ ^ self addGuardGoal: aComponent ].
	