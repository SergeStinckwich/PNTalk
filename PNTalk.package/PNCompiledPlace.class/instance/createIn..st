instance creation
createIn: aNet
	""

	| place |
"	place := PNPlace new name: name."
	place := PNStatPlace new name: name.
	aNet addComponent: place.

"	tokens associationsDo: [ :item | place add: (item key) mult: (item value) ]."

	^place.