event handling
addPostCondition

	| from to rel place trans morph expr src arc |

	from := UIManager default request: 'from transition:' initialAnswer: ''.
	to := UIManager default request: 'to place:' initialAnswer: ''.
	expr := UIManager default request: 'expression:' initialAnswer: ''.

	place := self placeNamed: to.
	trans := self morphNamed: from.

	src := 'postcond ', to, '(', expr, ')'.
	arc := PNParser new compileArc: src type: #postcond to: trans model.
	
	rel := PNPTRelation new arc: arc;  place: place model transition: trans model.
	rel netUI: self.
	morph := self morphForRelation: rel.
	self addMorph: morph.
