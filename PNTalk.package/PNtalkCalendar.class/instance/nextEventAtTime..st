accessing
nextEventAtTime: aTime

	| event |

	^(cal isEmpty)
		ifTrue: [ nil ]
		ifFalse: [ 
			event := cal at: 1.
			((event at: 1) <= aTime)		
				ifTrue: [ 
					cal removeFirst.
					event at: 2 
				].
		].