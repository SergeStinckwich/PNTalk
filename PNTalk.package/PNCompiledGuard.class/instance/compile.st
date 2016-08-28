compiler
compile

	| prefix rec src |
"	prefix := '[:listV :this :context | context processPort: '."
	prefix := '[ context processPort: '.
	self compileWithPrefix: prefix.

"	prefix := '[:listV :binds :context | context processPort: '."
	prefix := '[ context processPort: '.
	rec := (receiver isKindOf: PNCompiledArgument) 
		ifTrue: [ receiver compileToString ]
		ifFalse: [ receiver printString ].
	src := prefix, selector printString, ' withArguments: binds receiver: (', rec, ')]'.
	
"	fireAction := Object readFromString: src."
	fireAction := src.
		