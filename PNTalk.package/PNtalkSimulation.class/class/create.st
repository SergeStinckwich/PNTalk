as yet unclassified
create

	uniqID isNil ifTrue: [ uniqID := 0 ].
	uniqID := uniqID + 1.
	^ self newNamed: uniqID asString.
