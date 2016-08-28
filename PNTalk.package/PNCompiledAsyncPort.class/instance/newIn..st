initialize-release
newIn: aNet
	""

	| place |
	place := PNAsyncPort newAs: type.
	place name: name.
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