copying
copyWith: aTranslator

	| d |
	d := self class new.
	
	d space: space.
	
	content associationsDo: [:pair | d at: (pair key) put: (aTranslator copyElement: pair value) ].
	
	^ d.
	