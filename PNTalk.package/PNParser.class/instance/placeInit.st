parsing net
placeInit

	| actions |
	(alex isReserved: #init) ifFalse: [ ^nil ].
	self expectedReserved: #init.

	actions := self codeBody.
	actions do: [ :action | action compile ].
	^ actions.