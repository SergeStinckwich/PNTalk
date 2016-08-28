XXX instance creation
newAndSuspendIn: aWorld

	| object net |
	object := (PNObject newIn: aWorld) yourClass: self.
	object suspend.

	net := objectNet newIn: object.
"	net activate."
	net test.
	object start.
	^object newProxy.