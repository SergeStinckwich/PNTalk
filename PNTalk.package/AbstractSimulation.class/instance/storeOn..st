copying
storeOn: aStream

	aStream nextPut: $(.
	aStream nextPutAll: self class name, ' new'.	"initialized instance"
	(self class allInstVarNames difference: self doNotStore) do: [:n |
		aStream nextPutAll: ' instVarNamed: ';
			store: n;
			nextPutAll: ' put: ';
			store: (self instVarNamed: n);
			nextPut: $; ; 
			nextPutAll: String cr ].
	aStream nextPutAll: ' yourself)'; nextPutAll: String cr
