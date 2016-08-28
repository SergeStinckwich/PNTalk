new place testing
testValue: aPair forGoal: aGoal index: anIndex result: aResult
	
	| var mult |
	var := aPair key.
	mult := aPair value.
	(content includesKey: (var value)) 
		ifTrue: [ 
			self compareMult: mult value: (var value) result: aResult.
			aResult success ifTrue: [ listContext at: aGoal put: anIndex ].
		].
	^ aResult