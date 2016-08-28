as yet unclassified
printString

	^ value isNil
		ifTrue: [ '{@}' ]
		ifFalse: [ '{', value asString, '}' ].