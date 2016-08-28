as yet unclassified
initializeNetUI: aNetUI transition: aTransition
	"initializes this instance"
	| actionSource m guardSource |
	
self shouldNotImplement.
	
	netUI := aNetUI.
	transition := aTransition.

	actionSource := aTransition actionSourceCode.
	guardSource := aTransition guardSourceCode.
"	transNameMorph := (StringMorph contents: aTransition name).
	actionMorph := (TextMorph new newContents: actionSource).
	actionMorph width: 80.
"
	m := (self textMorphAt: 1).
"	m contents: aTransition name.
	self addLine.
	self addText: guardSource."
	m contents: guardSource.
	self addLine.
	self addText: actionSource.
	
	label := NCLabelMorph new string: aTransition name wrap: false minWidth: 20.
	label
		attachUnobnoxiouslyTo: self at: -15@-15;
"		align: label center with: 20@20;"
		dieWithInput: true.
	self pasteUpMorphOrWorld addMorph: label.
	
"
	self 
		addMorphBack: transNameMorph;
		width: (transNameMorph width max: actionMorph width) + 30;
		height: (transNameMorph height max: actionMorph height) + 10.
	self addLine.
	self
		addMorphBack: actionMorph;
		changeTableLayout.
"