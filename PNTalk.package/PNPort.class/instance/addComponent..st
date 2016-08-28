initialization
addComponent: aComponent

	(aComponent isPreCondition | aComponent isCondition)
		ifTrue: [ ^ self addArcGoal: aComponent ].
	(aComponent isPostCondition)
		ifTrue: [ ^ self addPostArcGoal: aComponent ].
	(aComponent isGuard)
		ifTrue: [ ^ self addGuardGoal: aComponent ].