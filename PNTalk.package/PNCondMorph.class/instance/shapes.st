initialize-release
shapes
	"answers the arrow shapes to be used in both ends of this relation"
"	self arrowNames: #(basicArrow basicArrow)."
	self makeBothArrows.
"
	^ {NCLineEndConstraintMorph openArrowheadShape. NCLineEndConstraintMorph openArrowheadShape}
"