domain processing
dStep

	| event |
	event := self chooseEvent.
	event isNil ifFalse: [	event perform ].
"	self test."
