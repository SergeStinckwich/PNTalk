as yet unclassified
storeOn: aStream

"	aStream nextPut: $(; nextPutAll: self class name, ' new'.
	(self class allInstVarNames difference: #('cachedTarget' 'owner')) do: [:n |
		aStream nextPutAll: ' instVarNamed: ';
			store: n;
			nextPutAll: ' put: ';
			store: (self instVarNamed: n);
			nextPut: $;; cr ].
	aStream nextPutAll: ' yourself)'; cr
"

	aStream cr; tab; nextPut: $(; nextPutAll: self class name; nextPutAll: ' toPathName: '; store: pathName.
	aStream nextPutAll: ') '
