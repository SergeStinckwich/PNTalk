DEVS
asAtomicDEVS

	| wrap |
	wrap := PNWorldToDEVSWrapper new.
	wrap name: name.
	wrap world: self.
	^ wrap.