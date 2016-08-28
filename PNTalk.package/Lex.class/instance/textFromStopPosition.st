source code
textFromStopPosition

	| text savedPosition |
"
	aBlock := [ :endPosition || str |
		str := ''.
		[ fnstream position < previousPosition ]
			whileTrue: [ str := str, fnstream next asSymbol asString ].
		str.
	].
	text := fnstream withPosition: stopPosition do: aBlock.
"
	savedPosition := fnstream position.
	fnstream position: stopPosition.

	text := ''.
	[ fnstream position < previousPosition ]
		whileTrue: [ text := text, fnstream next asSymbol asString ].

	fnstream position: savedPosition.

	stopPosition := nil.
	^text.