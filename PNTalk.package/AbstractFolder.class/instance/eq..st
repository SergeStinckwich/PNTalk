as yet unclassified
eq: anObject

	anObject class = self class ifFalse: [ NonEqDetected signal. ^ false ].

	self name = anObject name ifFalse: [ NonEqDetected signal. ^ false ].

	(self componentNames) do: [ :c | 
		((self componentNamed: c) eq: (anObject componentNamed: c)) ifFalse: [ NonEqDetected signal. ^ false ] ].

	^ true