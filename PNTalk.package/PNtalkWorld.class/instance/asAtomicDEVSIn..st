DEVS
asAtomicDEVSIn: aSimulation

	| wrap |
	wrap := self asAtomicDEVS.
	aSimulation addComponents: { wrap name -> wrap}.
	^ wrap.