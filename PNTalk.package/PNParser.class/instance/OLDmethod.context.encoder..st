smalltalk parsing
OLDmethod: doit context: ctxt encoder: encoderToUse
	" pattern [ | temporaries ] block => MethodNode."

	| sap blk prim temps messageComment methodNode |
	encoder := encoderToUse.
"	sap := self pattern: doit inContext: ctxt."
	"sap={selector, arguments, precedence}"
"	(sap at: 2) do: [:argNode | argNode isArg: true]."
	temps := self temporaries.
	messageComment := currentComment.
	currentComment := nil.
	prim := doit ifTrue: [0] ifFalse: [self primitive].
	self statements: #() innerBlock: doit.
	blk := parseNode.
"	doit ifTrue: [blk returnLast]
		ifFalse: [blk returnSelfIfNoOther].
"
	hereType == #doIt ifFalse: [^self expected: 'Nothing more'].
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
"