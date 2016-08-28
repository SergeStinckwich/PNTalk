simulation control
start

	self prepareToStart.
	world startSimulation.
	(MyRepository root) changed: #hierarchicalList.