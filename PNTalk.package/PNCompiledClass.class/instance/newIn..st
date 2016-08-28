instance creation
newIn: aWorld

	| object |
	object := PNObject new yourClass: self.
	aWorld addComponent: object.
	objectNet newIn: object.
	object test.
	object start.
	^object newProxy.