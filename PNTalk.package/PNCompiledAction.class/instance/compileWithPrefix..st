compiler
compileWithPrefix: aString

	| rec args src1 as src2 |
	rec := (receiver isKindOf: PNCompiledArgument) 
		ifTrue: [ receiver compileToString ]
		ifFalse: [ receiver printString ].

	args := ''.
	arguments do: [ :arg || tmp |
		args := args, 'add: ('.
		tmp := (arg isKindOf: PNCompiledArgument)
			ifTrue: [ arg compileToString ]
			ifFalse: [ arg printString ].
		args := args, tmp, ');'.
	].

	src1 := aString, selector printString, ' withArguments: (OrderedCollection new ', args, ' yourself) receiver: (', rec, ')]'.

"	compiledAction := Object readFromString: src1."
	compiledAction := src1.

	"============================ postAction"
	as := (assgn isNil)
		ifFalse: [ 'listV at: ', (assgn printString), ' put: result. ' ]
		ifTrue: [ ' ' ].

	assgnToQueue ifTrue: [ as := as, 'context valueQueue addLast: result.' ].
"	src2 := '[:listV :result :context | ', as, 'listV ]'. "
	src2 := '[ ', as, 'listV ]'. 

"	compiledPostAction := Object readFromString: src2."
	compiledPostAction := src2.

	cmpSrc := OrderedCollection new add: src1; add: src2; yourself.
