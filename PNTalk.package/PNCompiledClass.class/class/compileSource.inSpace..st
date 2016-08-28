compiling
compileSource: aString inSpace: aSpace
	""

	| element |
	element := PNParser new compile: aString.
	element yourNameSpace: aSpace.
