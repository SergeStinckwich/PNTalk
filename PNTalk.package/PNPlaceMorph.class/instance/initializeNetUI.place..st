as yet unclassified
initializeNetUI: aNetUI place: aPlace
	"initializes this instance"
	| m |
	
self shouldNotImplement.	
	
	netUI := aNetUI.
	place := aPlace.

"
	placeNameMorph := (StringMorph contents: aPlace name).
	placeTokensMorph := (StringMorph contents: aPlace tokens sourceCode).
"
	m := (self textMorphAt: 1).
"	m contents: aPlace name.
	self addLine.
	self addText: aPlace tokens sourceCode."
	m contents: aPlace tokens sourceCode.

	label := NCLabelMorph new string: aPlace name wrap: false minWidth: 20.
	label
		attachUnobnoxiouslyTo: self at: -15@-15;
"		align: label center with: 20@20;"
		dieWithInput: true.
	self pasteUpMorphOrWorld addMorph: label.
		
"
	self 
		addMorphBack: placeNameMorph;
		addMorphBack: placeTokensMorph;
		width: (transNameMorph width max: transNameMorph width) + 10;
		width: placeNameMorph width + 10;
		changeTableLayout.
"