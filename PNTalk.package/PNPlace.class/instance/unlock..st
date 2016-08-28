place testing
unlock: aContext
	
	| value mult num |
	value := (aContext at: 2) key.
	mult := (aContext at: 2) value.
	(mult > 0)
		ifTrue: [
			num := listLocks at: value.
			((num - mult) > 0) 
				ifTrue: [ listLocks at: value put: (num - mult) ]
				ifFalse: [ listLocks removeKey: value ].
			aContext at: 2 put: 0->0.	
			^ true.		
		].
	^ false.