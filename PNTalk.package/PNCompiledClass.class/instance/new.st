instance creation
new

	| object |
	object := PNObject new yourClass: self.
	objectNet createIn: object.
	^ object newProxy.
