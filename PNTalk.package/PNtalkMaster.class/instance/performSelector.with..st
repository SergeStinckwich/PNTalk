accessing
performSelector: aSelector with: anArray
	| msg |
	msg := PNtalkMessage new.
	msg selector: aSelector withArguments: anArray.
	^ self performMessage: msg.
