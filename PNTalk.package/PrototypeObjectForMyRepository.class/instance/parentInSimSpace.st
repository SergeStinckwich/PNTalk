as yet unclassified
parentInSimSpace

	| delimiter i dirName pathName |
	pathName := self pathName. delimiter := $/.
	(i := pathName findLast: [:c | c = delimiter]) = 0
		ifTrue:
			[dirName := String new]
		ifFalse:
			[dirName := pathName copyFrom: 1 to: (i - 1 max: 1)].

	^ self pathName size > 0 
		ifTrue: [ MyRepository root objectWithPathName: dirName ] 
		ifFalse: [ nil ].

