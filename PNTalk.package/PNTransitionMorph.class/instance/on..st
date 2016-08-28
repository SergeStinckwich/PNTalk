new
on: aTransition
	"initializes this instance"
	| actionSource guardSource chAction1 chAction2 content |

	model := aTransition.
	arcMorphs := OrderedCollection new.

	actionSource := model actionSourceCode.
	guardSource := model guardSourceCode.
	
	label := LabelMorph contents: model name.
	guardMorph := PluggableTextMorph on: self text: #guard accept: #acceptGuard:.
	"zmena textu, je treba zmenit velikosti vseho mozneho"
	chAction1 := [:t || ext x y | 
		ext := t asText asMorph extent. 
		x := ext x. y := ext y.
		guardMorph extent: (x+25)@(y+10).
	].
	guardMorph changedAction: chAction1.
	
	actionMorph := PluggableTextMorph on: self text: #action accept: #acceptAction:.
	"zmena textu, je treba zmenit velikosti vseho mozneho"
	chAction2 := [:t || ext x y | 
		ext := t asText asMorph extent. 
		x := ext x. y := ext y.
		actionMorph extent: (x+25)@(y+10).
	].
	actionMorph changedAction: chAction2.

	content := self class newColumn 
		color: Color transparent;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 1;
		borderColor: Color black;
		borderWidth: 1;
		wrapCentering: #center;
		cellPositioning: #topCenter.

	content addMorphBack: guardMorph.
	content addMorphBack: actionMorph.
	content color: Color veryVeryLightGray.

	self addMorphBack: label.
	self addMorphBack: content.

	self eventHandler: EventHandler new.
	self eventHandler on: #mouseStillDown send: #value to: true.

	chAction1 value: self guard.
	chAction2 value: self action.