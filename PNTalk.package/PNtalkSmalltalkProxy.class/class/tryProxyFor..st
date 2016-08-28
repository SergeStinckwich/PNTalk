instance creation
tryProxyFor: anObject

	(anObject isKindOf: Magnitude) | (anObject isKindOf: Collection) ifTrue: [ ^ anObject ].
	"ProbabilityDistribution"
	^ self new inner: anObject.
