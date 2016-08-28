stat
statFrom: t1 to: t2

	^ stat select: [:item || t |
		t := (item at: 1) + (item at: 2).
		(t >= t1) and: [ t <= t2 ] 
	].
