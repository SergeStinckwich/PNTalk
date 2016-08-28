copying
postCopyWith: aTranslator

	| l |
	
	super postCopyWith: aTranslator.
	
	l := listInvocatedMethods.
	listInvocatedMethods := Dictionary new.
	l associationsDo: [:pair || msg mc |
		msg := pair key copyWith: aTranslator.
		mc := pair value copyWith: aTranslator.
		self addInvocatedMethod: mc.
	].

	l := listProcesses.
	listProcesses := OrderedCollection new.
	l do: [:p || mc |
		mc := p copyWith: aTranslator.
		self addInvocatedProcess: mc.
	].