copying
sixxContentOn: aStream indent: level context: dictionary 

	aStream cr.
	(self class allInstVarNames difference: self doNotStore)
		do: [:var | (self instVarNamed: var)
				sixxOn: aStream
				name: var
				indent: level
				context: dictionary].

