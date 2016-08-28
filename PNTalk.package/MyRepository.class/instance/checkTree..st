misc
checkTree: nodes
	"MyRepository root checkTree: OrderedCollection new"

	(nodes includes: self) ifTrue: [ self error: 'Tree structure corrupted !!!' ].
	nodes add: self.
	namedComponents valuesDo: [ :v | 
		(v respondsTo: #checkTree:) ifTrue: [ v checkTree: nodes ] ].
	^ nodes
