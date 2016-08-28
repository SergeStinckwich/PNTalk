as yet unclassified
resetWording
	| t |
	t :=  model timeToShow < Float infinity
		ifTrue: [ (model timeToShow printShowingDecimalPlaces: 2) ]
		ifFalse: [ 'Infinity' ].
	^'Reset Simulation (time: ', t , ')'
