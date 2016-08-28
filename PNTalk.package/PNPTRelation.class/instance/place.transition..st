as yet unclassified
place: aPlace transition: aTrans

	place := aPlace.
	transition := aTrans.
	
	self isPostcondition
		ifTrue: [
			from := transition.
			to := place.
		]
		ifFalse: [
			from := place.
			to := transition.
		].
