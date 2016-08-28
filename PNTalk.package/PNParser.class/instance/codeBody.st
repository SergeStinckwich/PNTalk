parsing transition
codeBody

	| ret stream |

	stream := lexer stream.
	stream position: (stream position - 1).
	ret := self parseAction: stream ifFail: [].
	stream position: prevEnd.
	self lex.

	ret statements do: [:block | 
		(block instVarNamed: 'elements') do: [:statement | self processStatement: statement ]
	].
	ret := actionsCollection.
	actionsCollection := OrderedCollection new.
	^ ret.


