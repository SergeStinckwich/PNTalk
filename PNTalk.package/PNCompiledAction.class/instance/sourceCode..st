browser
sourceCode: aQueue

	| rec src tokens |

	assgnToQueue 
		ifTrue: [ src := '(' ]
		ifFalse: [ src := '' ].

	rec := (receiver isKindOf: PNCompiledArgument) 
		ifTrue: [ receiver sourceCode: aQueue ]
		ifFalse: [ self asSourceCode: receiver "asString printString" ].

	assgn isNil ifFalse: [ src := assgn asString, ' := ' ].
	src := src, rec, ' '.
	(selector asString includesSubString: ':')
		ifTrue: [
			tokens := selector asString findBetweenSubStrs: ':'.
			arguments do: [ :arg || tmp |
				src := src, tokens removeFirst, ': '.
				tmp := (arg isKindOf: PNCompiledArgument)
					ifTrue: [ arg sourceCode: aQueue ]
					ifFalse: [ self asSourceCode: arg "asString" ].
				src := src, tmp, ' '.	
			].
		]
		ifFalse: [
			src := src, selector asString, ' '.
			arguments do: [ :arg || tmp |
				tmp := (arg isKindOf: PNCompiledArgument)
					ifTrue: [ arg sourceCode: aQueue ]
					ifFalse: [ self asSourceCode: arg "asString" ].
				src := src, tmp, ' '.
			].	
		].

	assgnToQueue ifTrue: [ src := src, ')'. aQueue addLast: src. ^ '' ].

"	^ src, '. '."
	^ src, '. ', String cr.
