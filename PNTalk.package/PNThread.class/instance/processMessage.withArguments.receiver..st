inner processing
processMessage: selector withArguments: args receiver: receiver

	"The receiver is a primitive Smalltalk's object ..."
	| message |
"	receiver isPrimitive"
	(receiver isKindOf: PNtalkProxy)
		ifFalse: [ ^ receiver perform: selector withArguments: (args asArray) ].
"		ifTrue: [ ^ receiver reify perform: selector withArguments: (args asArray) ]."
	message := PNtalkMessage new selector: selector withArguments: (args asArray); sender: (self object); receiver: receiver.
	
"	receiver isSmalltalk
		ifTrue: [ message atomic ]."
	self master thread: self willContinueAfter: message.
	^ receiver performDomainMessage: message.
