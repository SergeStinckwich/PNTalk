as yet unclassified
exportTo: aFileDirectory

	| fs |
	aFileDirectory assureExistence.
	fs := (aFileDirectory forceNewFileNamed: self name asByteString).
	fs binary.
	fs nextPutAll: self contents.
	fs close.
