accessing
stop

	lightProcess isNil ifFalse: [
		lP := false.
		lightTimer unschedule.
		lightProcess := nil.
	].

	deepProcess isNil ifFalse: [
		dP := false.
		timer isNil ifFalse: [ timer unschedule ].
		deepProcess := nil.
	].
		