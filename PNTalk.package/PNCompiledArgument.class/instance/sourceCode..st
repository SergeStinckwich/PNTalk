as yet unclassified
sourceCode: aQueue

	^ value isNil 
		ifFalse: [ value asString ]
		ifTrue: [ aQueue removeFirst ].
