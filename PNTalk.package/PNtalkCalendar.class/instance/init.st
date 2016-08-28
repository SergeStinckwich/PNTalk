initialization
init

	cal := SortedCollection new.
	cal sortBlock: [:e1 :e2 | (e1 at: 1) <= (e2 at: 1)].