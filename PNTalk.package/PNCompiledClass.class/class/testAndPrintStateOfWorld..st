as yet unclassified
testAndPrintStateOfWorld: world

	world componentsDo: [ :obj | obj slave test. ].
	Transcript show: '==============================='; cr; show: 'time: ', (world time printString); cr.
	Transcript show: 'Object state:'; cr.
	
	"The message listComponents returns a collection of identifications (IDs) of the receiver's elements. Following message sending returns a collection of 
	object identifications placed in the world."
	world listComponents do: [ :id || state |
		
		"The message componentID: returns the metaobject representing appripriate element. The element is identified by its ID. The message state over 
		the element (the object in our case) gets the representation of the element's state."
		state := (world componentID: id) state.
		Transcript show: 'object ', (state at: 1) printString, ': ', (state at: 2); cr.
		(state at: 3) do: [ :item | 
			Transcript show: '  >> process ', (item at: 1) printString, ': ', (item at: 2); cr.
			(item at: 3) do: [ :place | Transcript show: '    >> place ', (place at: 1) printString, ': ', (place at: 2), ': '; show: (place at: 3); cr. ].
		].
	].