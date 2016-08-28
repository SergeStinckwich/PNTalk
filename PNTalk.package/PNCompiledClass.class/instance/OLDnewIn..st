XXX instance creation
OLDnewIn: aWorld

	| object net |
self halt.
	object := (PNObject newIn: aWorld) yourClass: self.

	net := objectNet newIn: object.
"	net activate."
	object test.
	object start.
	^object newProxy.