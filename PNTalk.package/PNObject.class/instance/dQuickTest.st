domain processing
dQuickTest
	| exec |
"self parent parent reportStream nextPutAll: ('test object id ', self id printString, String cr)."
	exec := false.
	self componentsDo: [ :item | exec := exec | (item test) ].
	executable := exec.
"
	(exec = executable) 
		ifFalse: [ 
			(executable := exec)
			ifTrue: [ self parent thisObjectIsExecutable: self ]
			ifFalse: [ self parent thisObjectIsNotExecutable: self ].
		].
"