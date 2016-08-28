accessing
transitionNamed: aName

	^ transitions at: aName ifAbsent: [ nil ].