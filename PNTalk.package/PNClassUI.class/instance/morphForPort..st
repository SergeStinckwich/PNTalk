drawing
morphForPort: aPort
	"finds the morph representing aCDClass, creates it if needed"
	| transMorph |
	
	"je treba odlisit inhibitor!!!!!!!"
	
	^ portMorphs
		detect: [:each | each model = aPort ]
		ifNone: [ 
			transMorph := aPort isInhibitor
				ifFalse: [ PNPortMorph on: aPort ]
				ifTrue: [ PNInhibitorMorph on: aPort ].
			portMorphs add: transMorph.
			transMorph
		].