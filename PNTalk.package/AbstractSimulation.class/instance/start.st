simulation control
start

	| r |
	accessProtect critical: [ r := self startUnprotected ].
	(MyRepository root) changed: #hierarchicalList.
	^ r
