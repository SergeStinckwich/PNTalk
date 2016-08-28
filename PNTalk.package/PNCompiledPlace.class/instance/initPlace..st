instance creation
initPlace: aPlace

	tokens associationsDo: [ :item | aPlace add: (item key) mult: (item value) ].
	^ aPlace.