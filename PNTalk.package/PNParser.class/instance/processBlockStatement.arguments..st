block post-parsing
processBlockStatement: statement arguments: arguments

	| args rec |
	(statement isKindOf: VariableNode)
		ifTrue: [ | l |
			l := arguments select: [:a | a name = statement name ].
			l isEmpty ifTrue: [ | a s ret |
				s := ReadWriteStream on: ''.
				s nextPutAll: ('{listV at: #', statement name asString, '}'). 
				s position: 0.
				ret := self parseAction: s ifFail: [].
				ret statements do: [:block | (block instVarNamed: 'elements') do: [:st | ^ st ] ].
			].			
		].

	(statement isKindOf: MessageNode)
		ifTrue: [ | ret |
			args := statement arguments.
			rec := statement receiver.
			ret := self processBlockStatement: rec arguments: arguments.
			ret notNil ifTrue: [ statement receiver: ret ].
			args copy do: [:a |
				ret := self processBlockStatement: a arguments: arguments.
				ret notNil ifTrue: [ | i | i := args indexOf: a. args at: i put: ret ].
			].
			statement arguments: args.
		].
	
	^ nil.