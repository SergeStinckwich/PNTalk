parsing transition
optAction

	| actions |
	(alex isReserved: #action) ifFalse: [^nil].

	self expectedReserved: #action.

	actions := self codeBody.
	actions do: [ :action | action compile ].

	^ actions.