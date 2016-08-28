as yet unclassified
toObject: o owner: p

	((o respondsTo: #pathName) and: [ o pathName > '' ])
		ifTrue: [ ^ (TemporarySymlink toPathName: o pathName) owner: p; yourself ] 
		ifFalse: [ ^ o ]

