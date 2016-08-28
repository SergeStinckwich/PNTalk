as yet unclassified
exportTo: aFileDirectory

	| fs |
	aFileDirectory assureExistence.
	fs := (aFileDirectory forceNewFileNamed: self name asByteString).
	fs nextPutAll: (CrLfFileStream new convertStringFromCr: (self contents convertToWithConverter: TextConverter defaultSystemConverter) asByteArray).
	fs close.
