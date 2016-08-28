drawing
drawImportedPlace: aPlace
	"draws the class aCDClass"
	| placeMorph |
	placeMorph := self morphForImportedPlace: aPlace.
	self addMorph: placeMorph.
	placeMorph position: self bounds origin + ((10 + (r nextInt: 400)) @ (10 + (r nextInt: 400))).
	^placeMorph