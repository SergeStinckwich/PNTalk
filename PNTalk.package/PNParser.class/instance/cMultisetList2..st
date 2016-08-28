multiset
cMultisetList2: aList

	(alex type = #char) & (alex isChar: $))
		ifTrue: [ self lex. ^aList ]
		ifFalse: [
			(alex type = #id) 
				ifTrue: [
					aList add: (PNVariable name: (self id))
				]
				ifFalse: [
					(alex isChar: $()
						ifTrue: [ aList add: self cMultisetList ]
						ifFalse: [ aList add: (self literal) ].
				].
		].

	(alex type = #eof) ifTrue: [ self parseError ].
	
	(alex type = #char) 
		ifTrue: [ 	(alex isChar: $,) ifTrue: [ self lex. ^self cMultisetList2: aList ].
				(alex isChar: $)) ifTrue: [ ^self cMultisetList2: aList ].
		].
	self parseError.