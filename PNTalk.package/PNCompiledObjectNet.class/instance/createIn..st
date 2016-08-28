instance creation
createIn: anObject
	""

	| net list |
	net := PNProcess new name: name.
	net compiledNet: self.
	anObject addComponent: net.
"	net := PNProcess newIn:anObject name: name."

	list := self collectPlacesFrom: (anObject yourClass).
	list do: [ :item |
		item createIn: net.
	].

	list := self collectTransitionsFrom: (anObject yourClass).
	list do: [ :item |
		item newIn: net.
	].

	^net.