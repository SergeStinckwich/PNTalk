as yet unclassified
addComponent: c

	c isObjectNet | c isMethod | c isPort ifTrue: [ self addCompiledNet: c ].
