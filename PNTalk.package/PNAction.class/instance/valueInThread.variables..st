processing
valueInThread: aThread variables: aVariables
	
"	^ self action value: aVariables value: (aThread object) value: aThread."
	
	| res |
	listV := aVariables.
	this := aThread object.
	context := aThread.
	res := self action value.
	listV := this := context := nil.
	^ res