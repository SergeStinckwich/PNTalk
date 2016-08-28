event handling
addInhibitor
	| name trans |
	name := UIManager default request: 'new synchronous port name'.
	trans := PNCompiledNegativePort new name: name.
	self drawPort: trans.
	model addPort: trans