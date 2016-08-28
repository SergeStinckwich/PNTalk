accessing
findTransitionNamed: aName

	"^ (transitionsList select: [:t | t name = aName ]) at: 1 ifAbsent: [ nil ]."
	
	^ ((self collectTransitionsFrom: parent) select: [:t | t name = aName ]) values at: 1 ifAbsent: [ nil ].