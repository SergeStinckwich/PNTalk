processing
fire: listVar
	""

	| mult variable fireVar fireMult |
	mult := expression value.
	variable := expression key.

	fireVar := variable isList
		ifTrue: [ variable confrontWithVariables: listVar ]
		ifFalse: [
			variable hasName
				ifTrue: [ listVar at: (variable name) ifAbsent: [ self error ] ]
				ifFalse: [ variable value ].
		].

	fireMult := mult hasName
		ifTrue: [ listVar at: (mult name) ifAbsent: [ self error ] ]
		ifFalse: [ mult value ]. 

	place add: fireVar mult: fireMult.

	(place name = 'return')
		ifTrue: [ self net finish: fireVar value ].