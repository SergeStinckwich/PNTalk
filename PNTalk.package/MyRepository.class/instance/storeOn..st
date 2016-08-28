copying
storeOn: aStream

	aStream nextPut: $(.
	aStream nextPutAll: self class name, ' new'.
	(self class allInstVarNames difference: {'parent'. 'namedComponents'. }) do: [:n |
		aStream nextPutAll: ' instVarNamed: ';
			store: n;
			nextPutAll: ' put: ';
			store: (self instVarNamed: n);
			nextPut: $; ; 
			nextPutAll: String cr ].

	"components"
	aStream nextPutAll: 'addComponents: {'; nextPutAll: String cr.
	namedComponents keysAndValuesDo: [ :k :v |
		aStream store: k; nextPutAll: ' -> '; store: v; nextPut: $.; nextPutAll: String cr ].
	aStream nextPutAll: '};'; nextPutAll: String cr.

	aStream nextPutAll: ' yourself)'; nextPutAll: String cr
