active processing
getMessage
	| msg |
	inputQueue isEmpty ifFalse: [ ^ inputQueue next ].
	self finishOperation.
	msg := inputQueue next.
"	self startOperation."
	^msg.
