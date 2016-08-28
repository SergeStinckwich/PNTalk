misc
objectWithPathName: p

	| c |
	c := MyRepository root.
	(p asString findTokens: '/') do: [ :n | c := c componentNamed: n ifAbsent: [ ^nil ] ]. 
	^ c
