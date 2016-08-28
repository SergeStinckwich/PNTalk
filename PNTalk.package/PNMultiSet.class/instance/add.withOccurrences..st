accessing
add: anObject withOccurrences: n

	| num nn |
	nn := n isNil ifTrue: [1] ifFalse: [n].
	num := collection at: anObject ifAbsent: [ 0 ].
	collection at: anObject put: (nn + num).