accessing
add: anObject mult: aMult

	| mult obj |
	obj := PNtalkProxy tryProxyFor: anObject.
	mult := content at: obj ifAbsent: [ 
		orderedContent add: obj.
		0 ].
	content at: obj put: (aMult + mult).

