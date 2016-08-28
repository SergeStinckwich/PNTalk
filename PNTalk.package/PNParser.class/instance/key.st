parsing net
key

(alex isId) ifTrue: [
	| nn |

	nn := lexer lex.

	( nn isChar: $:) 
		ifTrue: [ 
			lexer lexback: nn.
			nn := self id.
			self expectedChar: $:.
			^nn,':'
		]
		ifFalse: [
			lexer lexback: nn.
			^nil
		]
].

^nil