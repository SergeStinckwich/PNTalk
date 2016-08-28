processing
finishFor: aRetVal

	sender isNil ifFalse: [ sender thisMessageFinished: self with: aRetVal ].