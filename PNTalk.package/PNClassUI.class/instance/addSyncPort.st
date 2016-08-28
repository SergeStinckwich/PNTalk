event handling
addSyncPort
	| name trans |
	name := UIManager default request: 'new synchronous port name'.
	trans := PNCompiledPort new name: name.
	self drawPort: trans.
	model addPort: trans