printing
printString

	| str |
	str := [ inner printString ] on: Exception do: [:ex | inner class printString].
	^ '(proxy)', str.