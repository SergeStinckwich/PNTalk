place testing
testValue: aPair for: aContext result: aResult
	
	| var mult |
	var := aPair key.
	mult := aPair value.
	(content includesKey: (var value)) 
		ifTrue: [ 
			^ self compareMult: mult value: (var value) for: aContext result: aResult.
		].
	^ aResult