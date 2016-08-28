processing
processResults

	| result |
	result := collection removeFirst.
	result isNil ifTrue: [ ^ false ].

	result success ifTrue: [ | b |
		b := result pop.
		bindings := b variables.
		allBindings := b bindings.
"
		allBindings := result pop.
		bindings := result pop.
"
		^ true.
	].
