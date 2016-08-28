instance creation
newIn: aNet
	""

	| place |
	place := PNPlace new name: name.
"	place := PNStatPlace new name: name."
	aNet addComponent: place.
"	place name: name; parent: aNet."
"	place := PNPlace newIn: aNet name: name.	"

	tokens associationsDo: [ :item | place add: (item key) mult: (item value) ].
"
	thread := PNtalkThread newIn: self.
	self process addThread: thread.
	thread variables: aBinding.
	thread actions: actions.
	thread postActions: postArcGoals.
	thread perform.	
"
	^place.