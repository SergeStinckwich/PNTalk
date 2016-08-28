as yet unclassified
nameInSimSpace

	^ self pathName size > 0 ifTrue: [ (self pathName findTokens: '/') last ] ifFalse: [ '' ]