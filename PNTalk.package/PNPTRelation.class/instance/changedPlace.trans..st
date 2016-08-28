as yet unclassified
changedPlace: aPlace trans: aTrans

	(transition = aTrans)
		ifFalse: [ 
			transition remove: arc.
			aTrans addArc: arc.
			transition := aTrans.	
		].
		
	(place = aPlace)
		ifFalse: [ 
			place := aPlace.
			arc place: place name.
		].