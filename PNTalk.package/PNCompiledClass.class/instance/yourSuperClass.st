accessing
yourSuperClass

	superClassName isNil ifTrue: [ ^ nil ].
	^ self parent componentNamed: superClassName.
"	^ self yourNameSpace at: superClassName."