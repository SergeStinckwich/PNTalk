as yet unclassified
tryProxyFor: anObject

	anObject isNil ifTrue: [ ^ nil ].
	(anObject isKindOf: self) ifTrue: [ ^ anObject ].
	(anObject isKindOf: PNObject)
		ifTrue: [ ^ PNtalkObjectProxy new inner: anObject ].
	(anObject isKindOf: PNtalkComponent)
		ifFalse: [ ^ PNtalkSmalltalkProxy tryProxyFor: anObject ].
