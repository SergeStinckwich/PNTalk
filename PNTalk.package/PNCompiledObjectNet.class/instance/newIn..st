instance creation
newIn: anObject
	""

	| net list |
	net := PNProcess new name: name.
	net compiledNet: self.
	anObject addComponent: net.
"	net := PNProcess newIn:anObject name: name."

	list := self collectPlacesFrom: (anObject yourClass).
	list do: [ :item |
		item newIn: net.
	].

	list := self collectTransitionsFrom: (anObject yourClass).
	list do: [ :item |
		item newIn: net.
	].

	^net.