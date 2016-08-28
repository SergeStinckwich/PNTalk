accessing
performMessage: aMsg
	aMsg receiver: self.
	inputQueue nextPut: aMsg.
	^ aMsg.