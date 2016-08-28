domain processing
getExecutableObjects

	^ components select: [:item | item isExecutable ].
