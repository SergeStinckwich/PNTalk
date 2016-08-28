event handling
addPreCondition

	| from to rel place trans morph expr src arc |

	from := UIManager default request: 'from place:' initialAnswer: ''.
	to := UIManager default request: 'to transition:' initialAnswer: ''.
	expr := UIManager default request: 'expression:' initialAnswer: ''.

	place := self placeNamed: from.
	trans := self morphNamed: to.

	src := 'precond ', from, '(', expr, ')'.
	arc := PNParser new compileArc: src type: #precond to: trans model.
	
	rel := PNPTRelation new arc: arc;  place: place model transition: trans model.
	rel netUI: self.
	morph := self morphForRelation: rel.
	self addMorph: morph.
