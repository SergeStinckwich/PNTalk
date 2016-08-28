instance manipulation
performMessage: aMessage forObject: anObject

	| method |

	method := netsList at: (aMessage selector) ifAbsent: [nil].

	^(method isNil)
		ifFalse: [ (method performWithArguments: (aMessage arguments) forObject: anObject) message: aMessage; yourself ]
		ifTrue: [ 
			self yourSuperClass isNil
				ifFalse: [ self yourSuperClass performMessage: aMessage forObject: anObject. ]
				ifTrue: [	nil ].	
		].