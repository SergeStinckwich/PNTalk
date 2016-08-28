instance creation
newIn: anObject withID: id
	""

	| net |
	net := PNProcess new name: name.
	net compiledNet: self.
	id isNil ifFalse: [ net id: id ].
	anObject addComponent: net.
"	anObject addnet: method."

	placesList do: [ :item |
		item newIn: net.
"		method addPlace: place."
	].

	transitionsList do: [ :item |
		item newIn: net.
"		method addTransition: transition."
	].

	^net.