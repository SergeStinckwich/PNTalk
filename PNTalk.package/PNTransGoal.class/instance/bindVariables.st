accessing
bindVariables

	| listV |
	listV := variables copy.
	bindings associationsDo: [ :item | 
		listV at: (item key) put: (item value)
	].
	^ listV.