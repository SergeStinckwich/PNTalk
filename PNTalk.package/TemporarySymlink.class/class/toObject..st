as yet unclassified
toObject: o
	"Well-known object is represented by a TemporarySymlink."
	((o respondsTo: #pathName) and: [ o pathName > '' ])
		ifTrue: [ ^ TemporarySymlink toPathName: o pathName ] 
		ifFalse: [ ^ o ]

