place testing
test: aPair for: aContext

	| size var result |
	size := content size. 
	result := Result createFail.
	(size = 0) ifTrue: [ ^ result ].
	var := aPair key.

	(self unlock: aContext)
		ifTrue: [ (var isEmpty | var isList) ifFalse: [ ^ result ] ].

	(var isEmpty | var isList) 
		ifFalse:	[ ^ self testValue: aPair for: aContext result: result ]
		ifTrue: [ ^ self testVariable: aPair for: aContext result: result ].
