smalltalk post-parsing
processBlock: statement

	| args stat stream src block |

	src := ReadWriteStream on: ''.
	statement printOn: src indent: 0.
	
	block := PNCompiledBlock new.
	block source: src contents.
	
	args := statement instVarNamed: #arguments.
	stat := statement statements.
	
	stat do: [:s | self processBlockStatement: s arguments: args ].
	
	stream := ReadWriteStream on: ''.
"	statement printArgumentsOn: stream indent: 0."
	statement printOn: stream indent: 0.
	
	block compiledSource: stream contents.
	
	^ block.