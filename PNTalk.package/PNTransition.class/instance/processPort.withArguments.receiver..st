processing
processPort: aName withArguments: anArguments receiver: anObject

	"Zatim pouze pro konstantni objekty!!!!
	^ anObject perform: aName withArguments: anArguments asArray."

	| message |
"	Transcript nextPutAll: '-------->'; cr.
	t1 := Time millisecondClockValue."
	(anObject isKindOf: PNtalkProxy)
		ifFalse: [ ^ anObject perform: aName withArguments: (anArguments asArray) ].
	message := PNtalkMessage new selector: aName withArguments: anArguments.
	^ anObject testPort: message.

"	t2 := Time millisecondClockValue.
	Transcript nextPutAll: '--------<', (t2 - t1) printString; cr.
	
	^ r.
	"