accessing
morphForPlace: aPlace
	"finds the morph representing aCDClass, creates it if needed"
	| placeMorph |
	^ placeMorphs
		detect: [:each | each model = aPlace ]
		ifNone: [ 
"			placeMorph := PNPlaceMorph new initializeNetUI: self place: aPlace."
			placeMorph := PNPlaceMorph on: aPlace.
			placeMorphs add: placeMorph.
			placeMorph
		].