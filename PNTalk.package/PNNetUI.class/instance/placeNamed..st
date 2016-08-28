event handling
placeNamed: aPlaceName

	| placeList |
	placeList := placeMorphs select: [:m | m model name = aPlaceName ].
	^ placeList notEmpty
		ifTrue: [ placeList at: 1]
		ifFalse: [ nil ].
