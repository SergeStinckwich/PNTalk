port processing
testPort: aMsg

	| mContext r |

	aMsg domain.
	mContext := self yourClass performPort: aMsg forObject: self.
	"pokud neexistuje, presmerujeme primo na objekt"
	mContext isNil ifTrue: [
		^ self perform: (aMsg selector) withArguments: (aMsg arguments asArray).
	].
	r := mContext testFor: (aMsg arguments).

	^ r.
"
	goal := methodContext testFor: (aMsg arguments).
	result := goal test.
	^ methodContext finishTest: result forArguments: (aMsg arguments).
"
"	^ goal test."

"	^ Result createSuccess put: (methodContext testFor: (aMsg arguments))."

"
	^ (methodContext testFor: (aMsg arguments))
		ifTrue: [ Result createSuccess put: (methodContext yourBindings) ]
		ifFalse: [ Result createFail ].
"