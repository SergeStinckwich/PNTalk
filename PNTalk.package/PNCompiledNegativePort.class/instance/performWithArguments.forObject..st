accessing
performWithArguments: aParams forObject: anObject
	""

	| port |
"	port := PNPort newIn: anObject name: name."
	port := PNNegativePort new.
	port name: name.
"	anObject objectNet addComponent: port."
	port parent: anObject objectNet.

	condsList do: [ :arc | arc newIn: port ].
	precondsList do: [ :arc | arc newIn: port ].
	postcondsList do: [ :arc | arc newIn: port ].
	guardsList do: [ :guard | guard newIn: port].
	actionsList do: [ :action | action newIn: port ].

	port addFormalParams: formalParams.

	^port.