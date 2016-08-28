accessing
text: anObject

	text := anObject.
	parent ifNotNil: [ parent contentsChanged ].
	^ true
