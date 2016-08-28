smalltalk parsing
method: doit context: ctxt encoder: encoderToUse
	" pattern [ | temporaries ] block => MethodNode."

	| sap blk prim temps messageComment methodNode |
	encoder := encoderToUse.
"	sap := self pattern: doit inContext: ctxt."
	"sap={selector, arguments, precedence}"
"	(sap at: 2) do: [:argNode | argNode isArg: true]."
	doit ifFalse: [ self pragmaSequence ].
	temps := self temporaries.
"	temps := self temporariesIn: (sap at: 1).."
	messageComment := currentComment.
	currentComment := nil.
	doit ifFalse: [ self pragmaSequence ].
	prim := self pragmaPrimitives.
	self firstStatements: #() innerBlock: doit.
	blk := parseNode.
"	doit ifTrue: [blk returnLast]
		ifFalse: [blk returnSelfIfNoOther].
"
"	hereType == #doIt ifFalse: [^self expected: 'Nothing more']."
	self interactive ifTrue: [self removeUnusedTemps].

	^ blk.
"	methodNode := self newMethodNode comment: messageComment.
	^ methodNode
		selector: (sap at: 1)
		arguments: (sap at: 2)
		precedence: (sap at: 3)
		temporaries: temps
		block: blk
		encoder: encoder
		primitive: prim
		properties: properties
"