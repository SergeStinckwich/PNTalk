copying
sixxContentOn: aStream indent: level context: dictionary 

	aStream cr.
	(self class allInstVarNames difference: #('parent'))
		do: 
			[:nm | 
			(self instVarNamed: nm) 
				sixxOn: aStream
				name: nm
				indent: level
				context: dictionary].
	aStream tab: level