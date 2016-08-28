examples
execAckermann

	| repository cls obj |
	repository := MyRepository componentNamed: 'PNtalk classes'.

	cls := repository componentNamed: 'Ackermann'.

	obj := cls new.