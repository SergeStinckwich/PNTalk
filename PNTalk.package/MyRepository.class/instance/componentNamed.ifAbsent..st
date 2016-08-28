accessing
componentNamed: n ifAbsent: aBlock

	n == #self ifTrue: [ ^ self ].
	^ namedComponents at: n ifAbsent: aBlock