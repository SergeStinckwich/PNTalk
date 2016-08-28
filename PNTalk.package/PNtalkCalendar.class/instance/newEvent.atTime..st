accessing
newEvent: anEvent atTime: aTime

	| event |
	event := cal detect: [ :events | (events at: 1) = aTime ] ifNone: [ nil ].

	(event isNil)
		ifTrue: [	 cal add: (Array with: aTime with: (OrderedCollection new add: anEvent; yourself)). ]
		ifFalse: [ (event at: 2) add: anEvent ].