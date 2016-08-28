new accessing
copyElement: anElement

"Transcript show: 'copyElement > ', anElement printString; cr."

	(anElement isKindOf: PNObject)
		ifTrue: [ ^ world componentID: anElement id ].

	(anElement isKindOf: PNtalkSmalltalkProxy)
		ifTrue: [ | obj |  
			obj := smObjects keyAtValue: (anElement reify) ifAbsent: [ nil ].
			obj := obj isNil 
				ifTrue: [ smObjects at: (anElement reify) put: (anElement reify copy) ]
				ifFalse: [ obj ].
			^ PNtalkSmalltalkProxy tryProxyFor: obj.
		].
		
	(anElement isKindOf: PNtalkObjectProxy)
		ifTrue: [ ^ (world componentID: anElement id) newProxy ].
		
	(anElement isKindOf: PNtalkMessage)
		ifTrue: [ ^ self messageID: anElement id ifAbsent: [ anElement copyWith: self ] ].
		
	^ anElement copy.