as yet unclassified
at: pathName put: obj

	| c nm |
	(pathName = '') | (pathName = '/') ifTrue: [ MyRepository Root: obj. ^self ].
	c := MyRepository root.
	(pathName asString findTokens: '/') allButLast do: [ :n | 
		c := c componentNamed: n ifAbsent: [ 
			c addComponents: { n -> MyRepository new}.
			c := c componentNamed: n ] ].
	nm := (pathName asString findTokens: '/') last. 
	nm := c assureComponentName: nm.
	c addComponents: { nm -> obj }
