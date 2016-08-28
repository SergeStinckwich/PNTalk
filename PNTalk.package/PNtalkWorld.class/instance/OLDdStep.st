domain processing
OLDdStep

	| runnableObjects |
"	(self isActive) ifFalse: [ ^ nil ]."
"	runnableObjects := master executableObjects select: [ :item | activeObject includes: item ]."
"	runnableObjects := executableObjects."
	activity := true.
self parent reportStream nextPutAll: ('step.', String cr).
	runnableObjects := self getExecutableObjects.
	runnableObjects isEmpty
		ifFalse: [
"			runnableObjects values do: [ :object | object isActive ifTrue: [ object step ]]."
			runnableObjects values do: [ :object | object isActive ifTrue: [ object simulationStep ]].
			self dTest.
"			runnableObjects values do: [ :object | object isActive ifTrue: [ object test ]]."
		]
		ifTrue: [ 
			self stepTime
				ifFalse: [ ^ activity := false ].
		].
"	self performSelector: #dStep."
	