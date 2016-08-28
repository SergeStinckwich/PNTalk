as yet unclassified
printOn: aStream
	"Print the receiver on the stream"

	super printOn: aStream.
	aStream nextPutAll: '{variables =  '.
	variables printOn: aStream.
	aStream nextPutAll: ' bindings =  '.
	bindings printOn: aStream.
	aStream nextPutAll: '}'.
