smalltalk post-parsing
processStatement: statement

	(statement isKindOf: AssignmentNode)
		ifTrue: [ ^ self processAssignment: statement ].

	(statement isKindOf: MessageNode)
		ifTrue: [ ^ self processMessage: statement ].

	(statement isKindOf: LeafNode)
		ifTrue: [ ^ self processLeaf: statement ].

	(statement isKindOf: CascadeNode)
		ifTrue: [ ^ self processCascade: statement ].

	(statement isKindOf: BlockNode)
		ifTrue: [ ^ self processBlock: statement ].

	^ statement.
