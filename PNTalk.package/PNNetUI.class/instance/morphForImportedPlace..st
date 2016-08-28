accessing
morphForImportedPlace: aPlace
	"finds the morph representing aCDClass, creates it if needed"
	| placeMorph |
	^ placeMorphs
		detect: [:each | each model = aPlace ]
		ifNone: [ 
"			placeMorph := PNPlaceMorph new initializeNetUI: self place: aPlace."
			placeMorph := PNImportedPlaceMorph on: aPlace.
			placeMorphs add: placeMorph.
			placeMorph
		].