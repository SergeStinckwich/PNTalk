compiler
addArc: anArc

	anArc isPrecondition ifTrue: [ ^ precondsList addLast: anArc ].
	anArc isCondition ifTrue: [ ^ condsList addLast: anArc  ].	
	anArc isPostCondition ifTrue: [ ^ postcondsList addLast: anArc ].
	