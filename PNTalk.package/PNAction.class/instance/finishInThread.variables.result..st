processing
finishInThread: aThread variables: aVariables result: aResult
	
"	self postAction value: aVariables value: aResult value: aThread."
	
	| res |
	listV := aVariables.
	result := aResult.
	context := aThread.
	res := self postAction value.
	listV := result := context := nil.
	^ res