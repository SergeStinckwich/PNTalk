initialize-release
initialize

	super initialize.
	reportStream := nil.
	rtFactor := 0.
	gc := PNtalkGarbageCollector newFor: self.