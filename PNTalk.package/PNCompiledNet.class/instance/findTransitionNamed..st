accessing
findTransitionNamed: aName

	^ (transitionsList select: [:t | t name = aName ]) at: 1 ifAbsent: [ nil ].