copying
copyWith: aTranslator

	| mc |
	
	mc := aTranslator methodContextID: self id ifAbsent: [ nil ].
	mc isNil ifFalse: [ ^ mc ].

	mc := PNtalkMethodContext new.
	mc id: self id.
	aTranslator addMethodContext: mc.
	
	mc forObject: (aTranslator copyElement: object).
	mc message: (aTranslator copyElement: message).
	mc state: state.
	
	^ mc.
