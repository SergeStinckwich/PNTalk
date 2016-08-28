copying
copyWith: aTranslator

	| args msg rcv snd |
	
	msg := aTranslator messageID: id ifAbsent: [ nil ].
	msg isNil ifFalse: [ ^ msg ].
	
	msg := PNtalkMessage primitiveNew.
	msg id: self id.
	aTranslator addMessage: msg.
	
"	msg message: self selector."
	
	args := OrderedCollection new.
	arguments do: [:a | args addLast: (aTranslator copyElement: a) ].
	
	snd := aTranslator copyElement: sender.
	rcv := aTranslator copyElement: receiver.
	
	msg selector: self selector withArguments: args sender: snd.
	msg receiver: rcv.
	msg type: type.
	
	^ msg.