accessing
morphFor: aComponent
	"finds the morph representing aCDClass, creates it if needed"
	| |
	aComponent isPlace ifTrue: [ ^ self morphForPlace: aComponent. ].
	aComponent isPort ifTrue: [ ^ self morphForPort: aComponent. ].
	aComponent isTransition ifTrue: [ ^ self morphForTransition: aComponent. ].
