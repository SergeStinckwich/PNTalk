method context
activate
	self parent dTest.
	
	self parent parent parent reportStream nextPutAll: ('method ', self yourNet name, ' -- ', (self parent yourClass name), '(', (self parent id printString), ')', String cr).
