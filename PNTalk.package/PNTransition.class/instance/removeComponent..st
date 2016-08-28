accessing
removeComponent: aComponent

	(aComponent isThread)
		ifTrue: [ ^ super removeComponentNamed: aComponent id ].
	(aComponent isPreCondition | aComponent isCondition)
		ifTrue: [ ^ arcGoals remove: aComponent ].
	(aComponent isPostCondition)
		ifTrue: [ ^ postArcGoals remove: aComponent ].
	(aComponent isGuard)
		ifTrue: [ ^ guardGoals remove: aComponent ].