event handling
connectionsChanged

	| from to place trans |
	from := self constraints first input.
	to := self constraints last input.
	(from isNil | to isNil) ifTrue: [ ^ self ].
	
	place := from isPlace ifTrue: [ from model ] ifFalse: [ to model ].
	trans := from isTransition ifTrue: [ from model ] ifFalse: [ to model ].

	model changedPlace: place trans: trans.