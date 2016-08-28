instance creation
newIn: aNet withID: id
	""

	| transition |
	transition := PNTransition new name: name.	
	id isNil ifFalse: [ transition id: id ].
	aNet addComponent: transition.

	condsList do: [ :arc | arc newIn: transition ].
	precondsList do: [ :arc | arc newIn: transition ].
	postcondsList do: [ :arc | arc newIn: transition ].
	guardsList do: [ :guard | guard newIn: transition ].
	actionsList do: [ :action | action newIn: transition ].
	^transition.