misc
pathNameForObject: o

	| c path nam |
	path := ''.
	c := namedComponents select: [ :a | a value == o ].
	c size > 0 
		ifTrue: [ 
			c keys do: [ :key | nam := key ].
			^ (self pathName, '/', nam asString) copy ]
		ifFalse: [ 
			namedComponents valuesDo: [ :v |
				(v respondsTo: #pathNameForObject:) ifTrue: [ path := v pathNameForObject: o ].
				path size > 0 ifTrue: [ ^ path copy ] ]].
	^ path