state manipulation
findMethod: aSelector

	| method |

	method := netsList at: aSelector ifAbsent: [nil].

	^(method isNil)
		ifFalse: [ ^ method ] 
"		ifFalse: [ (method performWithArguments: (aMessage arguments) forObject: anObject) message: aMessage; yourself ]"
		ifTrue: [ 
			self yourSuperClass isNil
				ifFalse: [ self yourSuperClass findMethod: aSelector. ]
				ifTrue: [	nil ].	
		].