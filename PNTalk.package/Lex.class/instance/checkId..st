lexing
checkId: s

"(#('nil') includes: s) ifTrue: [^LexerT new type: #spec ; value: nil]."

(#('main' 'is_a' 'object' 'method' 'constructor' 'sync' 'place' 'trans' 'cond' 'precond' 'postcond' 'guard' 'action' 'class' 'init' 'inputPlace' 'outputPlace' 'inhibitor')
	includes: s)
		ifTrue: [
			^LexerT new type: #reserved ; value: (s asSymbol)
		]
		ifFalse: [
			^LexerT new type: #id ; value: s
		]