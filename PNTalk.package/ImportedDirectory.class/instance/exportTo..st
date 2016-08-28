as yet unclassified
exportTo: aFileDirectory

	aFileDirectory assureExistence.

	(aFileDirectory directoryExists: self name asByteString)
		ifFalse: [ aFileDirectory createDirectory: self name asByteString ].

	namedComponents keysAndValuesDo: [ :filename :file |
		file exportTo: (aFileDirectory directoryNamed: self name asByteString) ]

