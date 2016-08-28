compiler
remove: anArc

	anArc isPrecondition ifTrue: [ ^ precondsList remove: anArc ifAbsent: [nil] ].
	anArc isCondition ifTrue: [ ^ condsList remove: anArc ifAbsent: [nil] ].	
	anArc isPostCondition ifTrue: [ ^ postcondsList remove: anArc ifAbsent: [nil] ].
	