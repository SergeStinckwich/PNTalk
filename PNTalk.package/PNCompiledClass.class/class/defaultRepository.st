accessing
defaultRepository

	| repository |
	repository := MyRepository componentNamed: 'PNtalk classes'.
	repository isNil ifTrue: [ 
		repository := MyRepository new.
		repository name: 'PNtalk classes'.
		MyRepository root addComponent: repository named: (repository name).
	].
	^ repository