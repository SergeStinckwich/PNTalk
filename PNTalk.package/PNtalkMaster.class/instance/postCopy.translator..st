copying
postCopy: anObject translator: aTranslator

	listInvocatedMethods pairsDo: [:pair || msg mc |
		msg := pair key copyWith: aTranslator.
		mc := pair value copyWith: aTranslator.
		anObject addInvocatedMethod: mc.
	].

	listProcesses do: [:p || mc |
		mc := p copyWith: aTranslator.
		anObject addInvocatedProcess: mc.
	].