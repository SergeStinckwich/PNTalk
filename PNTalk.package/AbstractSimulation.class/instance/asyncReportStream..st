simulation control
asyncReportStream: s

	self asyncSafelyDo: [ reportStream := s ]
