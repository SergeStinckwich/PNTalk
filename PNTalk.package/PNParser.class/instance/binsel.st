parsing
binsel

| f1 f2 |

f1 := self selchar.

f1 isNil ifFalse: [
	f2 := self selchar.
	f2 isNil 
		ifFalse: [
			^(f1 asSymbol asString, f2 asSymbol asString) asSymbol.
		]
		ifTrue: [
			^f1 asSymbol
		]
].

^nil