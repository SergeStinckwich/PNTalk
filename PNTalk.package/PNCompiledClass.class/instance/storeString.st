printing
storeString

	| aStream |
	aStream := ReadWriteStream with: ''.
	self storeOn: aStream.
	^ aStream contents.