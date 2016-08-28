processing
testFor: aVariables

	| index realParams testing result newResult |
	realParams := PNtalkDictionary space: (self object yourClass parent).
	realParams at: #self put: self object.

"((name = 'unifiesWith:') & (self parent parent yourClass name = 'ACLMessage')) ifTrue: [self halt]."

	index := 0.
	formalParams do: [ :param || np |
		index := index + 1.
		np := aVariables at: index.
		(np isKindOf: PNVariable) ifFalse: [
"		realParams at: param put: (np asNewName: param)."
			realParams at: param put: np.
		].
	].

	testing := PNTransitionTesting newIn: self.
	testing arcGoals: arcGoals; guardGoals: guardGoals.
	result := testing complexTest: realParams.

	newResult := result collect: [ :item |
		self finishTest: item forArguments: aVariables.
	].
	^ newResult.
