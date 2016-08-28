accessing
collect

"	dP ifFalse: [ ^ [ self primDeepCollect ] forkAt: PNtalkGarbageCollector priority ]."
	dP ifFalse: [ ^ [ simulation world deepCollect ] forkAt: PNtalkGarbageCollector priority ].
	
	timer isNil ifFalse: [ timer unschedule ].
