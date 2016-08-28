as yet unclassified
reportStream

	reportStream ifNil: [ reportStream := (DummyStream on: nil) ].
	^ reportStream 
