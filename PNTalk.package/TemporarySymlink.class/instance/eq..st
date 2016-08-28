as yet unclassified
eq: aTemporarySymlink

	^ (aTemporarySymlink class = TemporarySymlink) 
		& (pathName = (aTemporarySymlink instVarNamed: 'pathName'))
