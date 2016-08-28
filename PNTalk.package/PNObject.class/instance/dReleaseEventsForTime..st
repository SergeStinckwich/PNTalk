domain processing
dReleaseEventsForTime: aTime
	| contexts |
	contexts := calendar nextEventAtTime: aTime.
	contexts isNil ifFalse: [ contexts do: [ :context | context finish ]].