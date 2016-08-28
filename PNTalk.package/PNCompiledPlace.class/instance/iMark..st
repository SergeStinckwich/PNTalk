compiler
iMark: iM
	
	iM isNil ifFalse: [ iM do: [:item | tokens add: (item key) withOccurrences: (item value) ] ].