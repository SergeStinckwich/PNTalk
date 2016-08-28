event handling
mouseDown: evt
"	super mouseDown: evt."
	evt yellowButtonPressed ifTrue: [self getMenu popUpInWorld].