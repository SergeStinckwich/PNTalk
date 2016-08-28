parsing
expected: t value: v

	((alex type = t) & (alex value = v)) 
		ifFalse: [
			self parsingError.
		]
		ifTrue: [
			self lex.
		].