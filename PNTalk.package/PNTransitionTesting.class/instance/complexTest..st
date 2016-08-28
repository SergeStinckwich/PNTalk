processing
complexTest: listV

	| ok result |
	
"	Transcript nextPutAll: '>>> ', parent yourName; cr.
	t1 := Time millisecondClockValue."
	
	variables := listV.
	bindings := OrderedCollection new.

	ok := (arcGoals isEmpty and: [ guardGoals isEmpty ]) 
		ifTrue: [ bindings addLast: PNtalkDictionary new. false ]
		ifFalse: [ true ].

	"!!!"
	[ ok ]
		whileTrue: [
"	ok ifTrue: ["
			(result := self test) success
				ifFalse: [ ok := false ]
				ifTrue: [ "mame navazani" 
"					goal := result pop."
					bindings addLast: (result pop).
"					bindings addLast: goal."
"					bindings addLast: (goal bindVariables)."
				].
		].

	"!!!!"
"	arcGoals do: [:g | g unlock ]."

"	t2 := Time millisecondClockValue.
	Transcript nextPutAll: '<<< ', parent yourName, ':', (t2 -t1) printString; cr. printString, ' : ', bindings printString; cr."
	
	^ bindings.