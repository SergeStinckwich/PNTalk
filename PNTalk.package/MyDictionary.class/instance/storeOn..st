copying
storeOn: aStream
	| noneYet |
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' new'.
	noneYet := true.
	self associationsDo: 
			[:each | 
			noneYet
				ifTrue: [noneYet := false]
				ifFalse: [aStream nextPut: $;].
			aStream nextPutAll: ' at: '.
			aStream store: (each key).
			aStream nextPutAll: ' put: '.
			aStream store: (each value).
			].
	noneYet ifFalse: [aStream nextPutAll: '; yourself'].
	aStream nextPut: $)