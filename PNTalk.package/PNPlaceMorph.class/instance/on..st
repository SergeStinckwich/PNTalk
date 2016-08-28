initialization
on: aPlace
	"initializes this instance"
	| chAction |

	model := aPlace.

	arcMorphs := OrderedCollection new.
	"self color: Color white."

	label := LabelMorph contents: model name.
	markingMorph := PluggableTextMorph on: self text: #marking accept: #accept:.
	"m autoAccept: true."
	"zmena textu, je treba zmenit velikosti vseho mozneho"
	chAction := [:t || ext x y | 
		ext := t asMorph extent. 
		x := ext x. y := ext y.
		markingMorph extent: (x + 30)@(y + 10).
		self extent: (x + 40)@(y + 50).
		markingMorph center: self position + (((x+40)/2)@((y+50)/2)).
		"m position: (self position + (50@20))."
	].
	markingMorph changedAction: chAction.

	self addMorphFront: markingMorph fromWorldPosition: 5@10.
	self addMorphFront: label fromWorldPosition: 0@ -15.

	self eventHandler: EventHandler new.
	self eventHandler on: #mouseStillDown send: #value to: true.
"	self eventHandler on: #mouseStillDown send: #move to: self."
"	m on: #mouseStillDown send: #mouseStillDown: to: self."

	chAction value: self marking.

	
"
	m := (self textMorphAt: 1).
	m contents: aPlace tokens sourceCode.
"	
"
	label := NCLabelMorph new string: model name wrap: false minWidth: 20.
	label
		attachUnobnoxiouslyTo: self at: -15@-15;
""		align: label center with: 20@20;""
		dieWithInput: true.
	self pasteUpMorphOrWorld addMorph: label.
"		
"
	self 
		addMorphBack: placeNameMorph;
		addMorphBack: placeTokensMorph;
		width: (transNameMorph width max: transNameMorph width) + 10;
		width: placeNameMorph width + 10;
		changeTableLayout.
"