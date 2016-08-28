compiler
sourceCode: aQueue

	| rec src |

	assgnToQueue 
		ifTrue: [ src := '(' ]
		ifFalse: [ src := '' ].

	rec := (receiver isKindOf: PNCompiledArgument) 
		ifTrue: [ receiver sourceCode: aQueue ]
		ifFalse: [ self asSourceCode: receiver "asString printString" ].

	assgn isNil ifFalse: [ src := assgn asString, ' := ' ].
	src := src, rec, ' '.

	assgnToQueue ifTrue: [ src := src, ')'. aQueue addLast: src. ^ '' ].

	^ src, '. ', String cr. ", String tab, String tab, String tab."
