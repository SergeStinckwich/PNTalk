method context
destroy

	self parent removeComponentNamed: self id.
	self parent removeMethod: self.