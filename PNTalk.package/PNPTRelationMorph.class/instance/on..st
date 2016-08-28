event handling
on: aPTRelation 
	"initializes this instance"
	| start finish originStart cornerStart originFinish cornerFinish centerStart centerFinish chAction |
	model := aPTRelation.

	self addHandles.
	
"	netUI := aNetUI.
	relation := aPTRelation.
	"
"	start := netUI morphFor: aPTRelation from.
	finish := netUI morphFor: aPTRelation to.
	"
	start := aPTRelation fromMorph.
	finish := aPTRelation toMorph.
	
	self verticesAt: 1 put: (start bounds center).
	self verticesAt: (self vertices size) put: (finish bounds center).

 	self color: (Color black alpha: 0.5).
	self lineWidth: 1.2.
	self arrowSpec: 5@5.
	self shapes.
	
	start addArcMorph: self.
	finish addArcMorph: self.

	valueMorph := PluggableTextMorph on: self text: #value accept: #acceptValue:.
	"zmena textu, je treba zmenit velikosti vseho mozneho"
	chAction := [:t || ext x y | 
		ext := t asText asMorph extent. 
		x := ext x. y := ext y.
		valueMorph extent: (x+25)@(y+10).
	].
	valueMorph changedAction: chAction.
	valueMorph position: self bounds center.
	self addMorphBack: valueMorph.
	chAction value: self value.

	self positionFor: start.
	self positionFor: finish.
	
"	label := self addLabel: (model arc sourceCodeOfToken) at: self midpoint.
	self beSmoothCurve.
"
