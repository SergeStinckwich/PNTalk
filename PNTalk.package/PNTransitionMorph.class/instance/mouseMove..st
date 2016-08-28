event handling
mouseMove: evt
"	super mouseDown: evt."
	| position top left |
	position := evt position.
	
	left := owner bounds left + 5.
	top := owner bounds top + 15.
	(position x < left) ifTrue: [ position := left@(position y)].
	(position y < top) ifTrue: [ position := (position x)@top].

	self position: position.
	arcMorphs do: [:arcMorph | arcMorph positionFor: self ].