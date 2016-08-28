simulation control
stop

	| r |
	accessProtect critical: [ r := self stopUnprotected ].
	(MyRepository root) changed: #hierarchicalList.
	^ r
