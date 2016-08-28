simulation control
asyncStopTime: endTime

	self asyncSafelyDo: [ stopTime := endTime ]. 				"in seconds"
