simulation control
reset
	super reset.
	self prepareToStop.
	world initModel.
"	self prepareToStart."