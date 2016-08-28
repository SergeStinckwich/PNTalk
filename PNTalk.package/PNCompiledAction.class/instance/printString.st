printing
printString

	| str |
	str := ''.
	arguments do: [:arg | str := str, arg printString, ' ' ].
	^ '{ ', assgn printString, ' := ', receiver printString, ' ', selector asString, ' #(', str, ') }'.