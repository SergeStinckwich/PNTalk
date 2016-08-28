domain processing
nextStep
	"Slouzi k simulaci v ramci PNtalku. Pokud je svet zanoren do jine simulace, pouziva se krokovani (step)."

	| |
	
Transcript show: 'next Step.'; cr; flush.

"	self dTest."
	self dStep.

	(parent rtFactor closeTo: 0) 
		ifFalse: [
			( (self time / parent rtFactor) <= self parent stopTime )
				ifTrue: [
				"	rtTimer := Timer at: ((startTime + ((self timeAdvance min: parent stopTime) / parent rtFactor * 1000)) min: SmallInteger maxVal) rounded.
					rtTimer wait."
					self time: (self time + (Time millisecondClockValue - startTime) / 1000).
					self performSelector: #nextStep
				]
				ifFalse: [ self running ].
		]
		ifTrue: [
			activity 
				ifTrue: [self performSelector: #nextStep ].
		].

"		ifFalse: [ 
self parent reportStream nextPutAll: ('Simulation ', parent name, ' suspended.', String cr). ]
			po ukonceni se pro jistotu otestuje jeste jednou, synchronni porty mohou jinak zpusobovat zastaveni -- melo by byt asi osetreno pri provolani portu, ale takto take funguje ...
			components do: [:item | item test ] 
		].	"
