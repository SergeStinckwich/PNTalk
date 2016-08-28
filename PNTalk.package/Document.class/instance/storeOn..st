as yet unclassified
storeOn: aStream

	"Text is filed out/in using #nextChunkPutWithStyle: and #nextChunkText."
	"It would be better to define Text>>storeString this way and rely on inherited #storeOn: here."

	aStream nextPut: $(.
	aStream nextPutAll: self class name, ' new '.
	aStream nextPutAll: 'name: ', name storeString, '; '.

	"text"	
	aStream nextPutAll: 'text: (ReadStream on: '.
	aStream store: ((ReadWriteStream on: String new) nextChunkPutWithStyle: text) contents.
	aStream nextPutAll: ') nextChunkText ;', String cr.

	"components (subclasses may need it)"
	aStream nextPutAll: 'addComponents: {'; nextPutAll: String cr.
	namedComponents keysAndValuesDo: [ :k :v |
		aStream store: k; nextPutAll: ' -> '; store: v; nextPut: $.; nextPutAll: String cr ].
	aStream nextPutAll: '};'; nextPutAll: String cr.

	aStream nextPutAll: ' yourself)'; nextPutAll: String cr
