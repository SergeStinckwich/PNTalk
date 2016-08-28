as yet unclassified
inspect

	"Hack inspect to open an inspector over the object pointed to by me."

	cachedTarget
		ifNil: [ 
			cachedTarget := MyRepository at: pathName 
		].
	cachedTarget
		ifNotNil: [
			^ cachedTarget inspect 
		] ifNil: [ 
			self error: 'Symlink target ', pathName, ' does not exist.' 
		].

