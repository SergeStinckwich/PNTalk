copying
postCopy

	world := world shallowCopy postCopy.
	world parent: self.
	
	world test.
	
	^ self.