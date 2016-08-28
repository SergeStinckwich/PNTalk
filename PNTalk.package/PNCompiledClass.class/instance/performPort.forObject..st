instance manipulation
performPort: aMessage forObject: anObject

	| port |
	port := portsList at: (aMessage selector) ifAbsent: [nil].

	^(port isNil)
		ifFalse: [ port performWithArguments: (aMessage arguments) forObject: anObject ]
		ifTrue: [ 
			self yourSuperClass isNil
				ifFalse: [ self yourSuperClass performPort: aMessage forObject: anObject. ]
				ifTrue: [	nil ].		
		].