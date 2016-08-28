domain processing
performMessage: aMessage in: aMethodContext

	^ aMessage isDomain
		ifTrue: [ self performDomainMessage: aMessage in: aMethodContext ]
		ifFalse: [ self perform: (aMessage selector) withArguments: (aMessage arguments) ].
"
	methodContext := aMethodContext.
	^ aMessage isDomain
		ifTrue: [ self performDomainMessage: aMessage ]
		ifFalse: [ self perform: (aMessage selector) withArguments: (aMessage arguments) ].
"