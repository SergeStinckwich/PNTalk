as yet unclassified
exportTo: aFileDirectory

	| fs |
	aFileDirectory assureExistence.
	fs := aFileDirectory forceNewFileNamed: self name asByteString, '.tex'.
	fs nextPutAll: (CrLfFileStream new convertStringFromCr: (text asString convertToWithConverter: TextConverter defaultSystemConverter) asByteArray). 
	fs close.
	namedComponents keysAndValuesDo: [ :filename :fileOrDirectory |
		fileOrDirectory exportTo: aFileDirectory ].
