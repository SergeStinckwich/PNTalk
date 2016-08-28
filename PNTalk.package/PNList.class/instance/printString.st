browser
printString
	
	| src tmp i item |
	src := '('.
	i := self size.
	1 to: (i-1) do: [:ii |
		item := self at: ii.
		tmp := ((item isKindOf: PNVariable) | (item isKindOf: PNList)) 
			ifTrue: [ item sourceCode ]
			ifFalse: [ item printString ].
		src := src, tmp, ', '
	].

	item := self at: (self size).
	tmp := ((item isKindOf: PNVariable) | (item isKindOf: PNList)) 
		ifTrue: [ item sourceCode ]
		ifFalse: [ item printString ].
	^ src, tmp, ')'.