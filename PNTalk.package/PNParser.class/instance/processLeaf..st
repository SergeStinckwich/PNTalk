smalltalk post-parsing
processLeaf: statement

	(statement isKindOf: VariableNode)
		ifTrue: [ ^ PNCompiledArgument new value: (statement name) ].

	^ (statement key).