event handling
addCondition

	| from to rel placeList place transList trans morph expr src arc |

	from := UIManager default request: 'from:' initialAnswer: ''.
	to := UIManager default request: 'to:' initialAnswer: ''.
	expr := UIManager default request: 'expression:' initialAnswer: ''.	

	place := self placeNamed: from.
	trans := self morphNamed: to.

	src := 'cond ', from, '(', expr, ')'.
	arc := PNParser new compileArc: src type: #cond to: trans model.
	
	rel := PNPTRelation new arc: arc;  place: place model transition: trans model.
	rel netUI: self.
	morph := self morphForRelation: rel.
	self addMorph: morph.
	
true ifTrue: [  ^ self ].

	
"	placeList := placeMorphs select: [:m | m model name = from ]."
	placeList := placeMorphs select: [:m | m shownPlace name = from ].
	place := placeList notEmpty
		ifTrue: [ placeList at: 1]
		ifFalse: [ ^ nil ].
"	transList := transMorphs select: [:m | m model name = to ]."
	transList := transMorphs select: [:m | m shownTransition name = to ].
	trans := transList notEmpty
		ifTrue: [ transList at: 1]
		ifFalse: [ ^ nil ].

	src := 'cond ', from, '(', expr, ')'.
	arc := PNParser new compileArc: src type: #cond to: trans shownTransition.
	
	rel := PNPTRelation new.
	rel arc: arc.
	rel from: place shownPlace to: trans shownTransition.
	morph := self morphForRelation: rel.
	self addMorph: morph.