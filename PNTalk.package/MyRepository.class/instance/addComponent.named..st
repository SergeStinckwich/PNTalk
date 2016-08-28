accessing
addComponent: c named: n

	namedComponents at: n put: c.
	c parent: self.
	c name: n.


