processing
testTransitions
	
	transitions do: [:t | t test ifTrue: [ ^ t ]].
	^ nil.