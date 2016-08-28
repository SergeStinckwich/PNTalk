processing
test

"	arcsStack isEmpty ifTrue: [ ^ self initTest ]."

	guardsStack isEmpty
		ifTrue: [ 
			(self testArc: arcsStack)
				ifFalse: [ ^ Result createFail ]
				ifTrue: [ 
					arcsStack isEmpty 
						ifTrue: [ ^ self testGuards: variables ]
						ifFalse: [ ^ self testGuards: (arcsStack get bindVariables) ]
				]
		]
		ifFalse: [ ^ self backwardTestGuard: guardsStack ].
		