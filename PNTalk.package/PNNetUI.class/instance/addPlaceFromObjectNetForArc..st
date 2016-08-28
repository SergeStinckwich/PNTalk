drawing
addPlaceFromObjectNetForArc: cond

	| pl morph places |
	places := model parent objectNet places.
	pl := places select: [:each | each name = cond place ].
	morph := pl isEmpty
		ifTrue: [ | m |
			pl := model parent objectNet inheritedPlaces at: cond place.
			m := self morphForImportedPlace: pl.
"			m color: (Color gray: 0.7)."
			m.
		]
		ifFalse: [ | m |
			pl := pl at:1.
			m := self morphForImportedPlace: pl.
"			m color: Color yellow."
			m.
		].
"	morph := self morphForPlace: pl.
	morph color: Color white.
	"
	self addMorph: morph.
	^ pl.
