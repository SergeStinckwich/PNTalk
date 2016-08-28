domain processing
performDomainMessage: aMessage in: aContext

	^ methodContext isNet
		ifTrue: [ methodContext wait; activate ]
		ifFalse: [ self perform: (aMessage selector) withArguments: (aMessage arguments) ].