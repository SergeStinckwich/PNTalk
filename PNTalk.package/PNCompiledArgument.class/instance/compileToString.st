as yet unclassified
compileToString

	^ value isNil 
		ifFalse: [ 'listV at: ', value asSymbol printString ]
		ifTrue: [ 'context valueQueue removeFirst' ].