accessing
performSelector: aSelector
	| msg |
	msg := PNtalkMessage new.
	msg selector: aSelector withArguments: {}.
	^ self performMessage: msg.
