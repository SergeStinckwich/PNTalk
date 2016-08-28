processing
finishTest: aBinding forArguments: aVariables

	| index variables res bindVariables |
	index := 0.
	bindVariables := aBinding variables.
	variables := PNtalkDictionary new.
	formalParams do: [ :param || np |
		index := index + 1.
		np := aVariables at: index.
		(np isKindOf: PNVariable) ifTrue: [
			variables at: (np name) put: (bindVariables at: param).
		].
	].

	res := Result createSuccess.
	aBinding variables: variables.
	res put: aBinding.
"	res put: variables.
	res put: aBinding.
"
	^ res.