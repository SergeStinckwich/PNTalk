instance creation
new
	"pro deserializaci objektu - pekna blbost, potrebuje znat i objekt, jinak nedokaze navazat mista z objektove site"

	| net |
	net := PNProcess new name: name.
	net compiledNet: self.

	placesList do: [ :item |
		item createIn: net.
"		method addPlace: place."
	].

	transitionsList do: [ :item |
		item newIn: net.
"		method addTransition: transition."
	].

	^net.