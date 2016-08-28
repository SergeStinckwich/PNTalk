place testing
testVariable: aPair for: aContext result: aResult
	
	| var mult index ok size value res |
	var := aPair key copy.
	mult := aPair value.
	index := aContext at: 1.
	size := content size.
	ok := index < size.

	[ ok ]
		whileTrue: [
			index := index + 1.
			value := orderedContent at: index.
			(self compareVariable: var with: value result: aResult)
				ifTrue: [
					res := self compareMult: mult value: value for: aContext result: aResult.
					res success ifTrue: [ aContext at: 1 put: index. ^ aResult ].
				].
			ok := (index < size).
"			ok := (index <= size)."
		].

	aContext at: 1 put: 0.
	^ aResult