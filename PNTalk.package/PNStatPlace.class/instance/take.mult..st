inherited
take: anItem mult: aMult

	| st difT size |
	super take: anItem mult: aMult.
	st := storageTime at: anItem.
	difT := self time - st.
	storageTime at: anItem put: difT.
"	maxTime := maxTime max: difT.
	storageSize addLast: (content size)."
	
	size := (difT < 0.0000000000001)
		ifTrue: [ content size ]
		ifFalse: [ content size + 1].
	stat addLast: {#size. self time. size}.
	stat addLast: {#waiting. self time. difT. }.