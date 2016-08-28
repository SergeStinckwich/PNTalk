as yet unclassified
addComponent: c named: n

	c isObjectNet | c isMethod | c isPort ifTrue: [ c name: n. self addCompiledNet: c ].
