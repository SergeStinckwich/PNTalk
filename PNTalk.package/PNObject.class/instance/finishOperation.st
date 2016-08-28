active processing
finishOperation
"	self dTest."

"	self test.
	self isExecutable ifTrue: [ self parent parent tryStep ]."
	
	self test.
"	self isExecutable ifFalse: [ self test ]."
	self parent parent tryStep.
	
"	self isExecutable ifTrue: [ self parent performSelector: #tryStep ]."

"
	(self parent isActive not & self isExecutable)
		ifTrue: [ self parent performSelector: #dStep ].
"
	"jinac, trosku obecneji kvuli DEVS atd."

"	self parent thisObjectIsReady: self."
