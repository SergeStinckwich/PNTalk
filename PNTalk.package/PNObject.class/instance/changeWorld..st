initialize-release
changeWorld: aWorld
	
	self stop.
	parent notNil ifTrue: [parent removeComponentNamed: self id].
	aWorld addComponent: self.
	self test.
	self start.