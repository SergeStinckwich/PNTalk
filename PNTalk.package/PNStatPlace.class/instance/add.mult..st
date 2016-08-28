inherited
add: anObject mult: aMult

	| |
	stat addLast: {#size. self time. content size}.
	
	super add: anObject mult: aMult.
"	size := content size.
	maxSize := maxSize max: size."
	storageTime at: anObject put: (Time millisecondClockValue).
	storageTime at: anObject put: self time. 
"	storageSize addLast: (content size)."
