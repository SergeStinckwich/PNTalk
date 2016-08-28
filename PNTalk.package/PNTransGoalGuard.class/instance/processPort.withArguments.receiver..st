inner processing
processPort: aName withArguments: anArguments receiver: anObject

	| message |
	message := PNtalkMessage new selector: aName withArguments: anArguments.
	(anObject isKindOf: PNtalkProxy)
		ifTrue: [ ^ anObject performBindedPort: message ].
	^ nil.

