browser
sourceCode

	| src tokens |
	src := 'method '.
	(name includesSubString: ':')
		ifTrue: [
			tokens := name findBetweenSubStrs: ':'.
			paramsList do: [ :param | src := src, tokens removeFirst, ': ', param, ' '].
		]
		ifFalse: [
			src := src, name.
		].
	src := src, String cr. 
	placesList do: [ :item | src := src, item sourceCode, String cr. ].
	transitionsList do: [ :item | src := src, item sourceCode, String cr. ].
	^ src.