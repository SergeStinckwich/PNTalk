accessing
addComponent: aComponent

	super addComponent: aComponent.
	aComponent isPlace ifTrue: [ places at: (aComponent name) put: aComponent ].
	aComponent isTransition ifTrue: [ transitions at: (aComponent name) put: aComponent ].