as yet unclassified
as: aType
	(aType = #input) ifTrue: [ ^ self asInput ].
	(aType = #output) ifTrue: [ ^ self asOutput ].
	self error.
	