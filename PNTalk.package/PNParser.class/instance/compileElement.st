compile
compileElement

	| mainClass |
	(alex isReserved: #class) ifTrue: [ ^ self parseClass ].
	(alex isReserved: #object) ifTrue: [ ^ self parseNet ].
	(alex isReserved: #method) ifTrue: [ ^ self parseNet ].
	(alex isReserved: #main) ifTrue: [ 
		self expectedReserved: #main.
		mainClass := self id.
		^ nil.
	].
	self error.