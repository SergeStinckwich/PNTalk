smalltalk parsing
firstStatements: argNodes innerBlock: inner

	| stmts returns start more blockComment |
	stmts := OrderedCollection new.
	"give initial comment to block, since others trail statements"
	blockComment := currentComment.
	currentComment := nil.
	returns := false.
	more := hereType ~~ #rightBracket.
	[more]
		whileTrue: 
		[start := self startOfNextToken.
		(returns := self matchReturn)
			ifTrue: 
				[self actionsExpression
					ifFalse: [^self expected: 'Expression to return'].
				self addComment.
				stmts addLast: (parseNode isReturningIf
					ifTrue: [parseNode]
					ifFalse: [ReturnNode new
							expr: parseNode
							encoder: encoder
							sourceRange: (start to: self endOfLastToken)])]
			ifFalse: 
				[self actionsExpression
					ifTrue: 
						[self addComment.
						stmts addLast: parseNode]
					ifFalse: 
						[self addComment.
						stmts size = 0
							ifTrue: 
								[stmts addLast: 
									(encoder encodeVariable:
										(inner ifTrue: ['nil'] ifFalse: ['self']))]]].
		returns 
			ifTrue: 
				[self match: #period.
				(hereType == #rightBracket or: [hereType == #doIt])
					ifFalse: [^self expected: 'End of block']].
		more := returns not and: [self match: #period]].
	parseNode := BlockNode new
				arguments: argNodes
				statements: stmts
				returns: returns
				from: encoder.
	parseNode comment: blockComment.
	^ true