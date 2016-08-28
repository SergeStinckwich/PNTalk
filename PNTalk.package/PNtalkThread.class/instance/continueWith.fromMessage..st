processing
continueWith: aValue fromMessage: aMessage
	
"	result resultValue: aValue."
	result put: aValue.
	self process newEvent: self.