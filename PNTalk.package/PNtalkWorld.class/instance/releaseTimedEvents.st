domain processing
releaseTimedEvents

	| t |

	t := self time.
	
	changedTime ifTrue: [
		[ self releaseTimedEventsFor: t ] whileTrue: [ ].
		changedTime := false.
	].
