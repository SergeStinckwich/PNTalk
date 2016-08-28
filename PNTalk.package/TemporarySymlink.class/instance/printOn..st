as yet unclassified
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: '('; print: owner; nextPutAll: '-->'; nextPutAll: pathName; nextPutAll: ')'.