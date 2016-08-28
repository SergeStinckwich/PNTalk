domain processing
dTest
	| exec start stop |
"self parent parent reportStream nextPutAll: ('test object id ', self id printString, String cr)."

start := Time primMillisecondClock.

	exec := false.
	self componentsDo: [ :item | exec := exec | (item test) ].
	executable := exec.

stop := Time primMillisecondClock.
Transcript show: 'Test object id: ', self id printString, 'for: ', (stop - start) asString, ' ms'; cr; flush.

"
	(exec = executable) 
		ifFalse: [ 
			(executable := exec)
			ifTrue: [ self parent thisObjectIsExecutable: self ]
			ifFalse: [ self parent thisObjectIsNotExecutable: self ].
		].
"