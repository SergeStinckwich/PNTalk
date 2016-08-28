processing
OLDfinishTest: aResult forArguments: aVariables

	| index result variables |
	aResult success ifFalse: [ ^ aResult ].
	index := 0.
	result := aResult get.
	variables := PNtalkDictionary new.
	formalParams do: [ :param || np |
		index := index + 1.
		np := aVariables at: index.
		(np isKindOf: PNVariable) ifTrue: [
			variables at: (np name) put: (result at: param).
		].
	].

"	aResult at: 2 put: variables."
	aResult put: variables.
	^ aResult.