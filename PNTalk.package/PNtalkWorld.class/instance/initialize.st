initialize-release
initialize
	super initialize.
	time := 0.
	changedTime := false.
	clockCounter := 0.

	calendar := PNtalkCalendar new.
	timeSuspend := false.
	activity := false.
	
	garbageComponents := Dictionary new.
	
"	executor := self."
