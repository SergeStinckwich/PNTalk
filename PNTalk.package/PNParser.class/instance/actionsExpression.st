smalltalk parsing
actionsExpression

	hereType == #leftBrace
		ifTrue: [self braceExpression]
		ifFalse: [self primaryExpression ifFalse: [^ false]].
	^ true