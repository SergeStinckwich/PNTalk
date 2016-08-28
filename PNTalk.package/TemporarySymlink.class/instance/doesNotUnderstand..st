as yet unclassified
doesNotUnderstand: aMessage

	cachedTarget
		ifNil: [ cachedTarget := MyRepository at: pathName ].
	cachedTarget
		ifNotNil: [
			"self replaceYourselfByTarget"	"automagical replacement !!!" "not tested !!!!"
			^ cachedTarget perform: aMessage selector withArguments: aMessage arguments ]
		ifNil: [ self error: 'Symlink target ', pathName, ' does not exist.' ].

