event handling
yellowButtonDown: evt onEnd: aConstraintOrNil 
	evt yellowButtonPressed ifTrue: [self getMenu popUpInWorld].
	