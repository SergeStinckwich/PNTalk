copying
postCopy
	
	| l |
	l := components.
	components := Dictionary new.
	l valuesDo: [:proc | self addComponent: (proc shallowCopy). ].
