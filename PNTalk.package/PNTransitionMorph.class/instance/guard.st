event handling
guard
	
	| s |
	s := model guardSourceCode.
	"kvuli tomu, ze posledni znak je cr - je treba odstranit"
	^(s size > 1)
		ifTrue: [ (s asText copyFrom: 1 to: (s size - 1)) asString ]
		ifFalse: [ s ].