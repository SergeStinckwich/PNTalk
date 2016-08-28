accessing
at: aKey ifAbsent: aBlock

	| val |
	val := content at: aKey ifAbsent: [nil].
	(val isNil & space isNil) ifTrue: [ ^ nil ].
	val isNil ifTrue: [ 
		val := space componentNamed: aKey asString.
		val isNil
			ifTrue: [ 
				val := Smalltalk at: (aKey asSymbol) ifAbsent: aBlock.
				val isNil ifTrue: [ ^ PNVariable name: aKey ].
			].
	].
"	^val."
	^ PNtalkProxy tryProxyFor: val.
