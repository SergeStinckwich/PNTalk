initialize-release
initialize

	super initialize.
	executable := false.
	activity := true.
	random := Random new.
	calendar := PNtalkCalendar new.
	listDependencies := Dictionary new.
	proxies := WeakRegistry new.

"	self parent thisObjectIsBusy: self.
""	activity := false.
	semaphoreExec := SharedQueue new.
"
