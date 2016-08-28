accessing
destroy

	destroyed := true.
	^ server isNil ifFalse: [ server closeAndDestroy ] ifTrue: [ nil ].
