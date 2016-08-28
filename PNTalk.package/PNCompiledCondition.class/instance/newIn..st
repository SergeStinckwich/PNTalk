instance creation
newIn: aTransition
	""

	| expr content net anArc placeMO |
	(type = #postcond)
		ifTrue: [ anArc := PNTransGoalPostCondition newIn: aTransition ]
		ifFalse: [ 
			(type = #precond)
				ifTrue: [ anArc := PNTransGoalPreCondition newIn: aTransition. ]
				ifFalse: [ anArc := PNTransGoalCondition newIn: aTransition. ].
		].

"	expr := PNArcExpression new.
	expr expression: (content at: 2) value.
	expr mult: (content at: 1) value.
"
	expr := arc copy.

	net := aTransition parent.
	placeMO := net placeNamed: place ifAbsent: [ ((net parent) objectNet) placeNamed: place ].

	(net isNil)
		ifFalse: [ anArc place: placeMO expr: expr ]
		ifTrue: [ self error ].

	^anArc.