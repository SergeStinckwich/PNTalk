compiling
compileClass: aString
	""

	| element |
	element := PNParser new compile: aString.
	^ element.