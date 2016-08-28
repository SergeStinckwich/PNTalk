garbage collector
primLightCollect

	| objs |
	objs := components select: [:obj | (obj id ~= 1) & (obj numberOfProxies = 0) ].
	objs keysDo: [:key |
"		garbageComponents at: key put: (components at: key)."
		components removeKey: key.
	].