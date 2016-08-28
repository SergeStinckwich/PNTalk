compiler
content: aContent

	aContent do: [:item |
		item isPlace ifTrue: [ self addPlace: item ].
		item isTransition ifTrue: [ self addTransition: item ].
	].