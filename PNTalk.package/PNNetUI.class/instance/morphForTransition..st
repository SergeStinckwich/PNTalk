accessing
morphForTransition: aTransition
	"finds the morph representing aCDClass, creates it if needed"
	| transMorph |
	^ transMorphs
		detect: [:each | each model = aTransition ]
		ifNone: [ 
"			transMorph := PNTransitionMorph new initializeNetUI: self transition: aTransition."
			transMorph := PNTransitionMorph on: aTransition.
			transMorphs add: transMorph.
			transMorph
		].