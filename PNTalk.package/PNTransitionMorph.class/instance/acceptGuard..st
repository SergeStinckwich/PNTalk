event handling
acceptGuard: aText

	| src a |

	src := aText asString.
	src := ' guard {', src, ' }'.
	a := PNParser new compileGuard: src.
	a notNil ifTrue: [ model guards: a. ].
"			name := aText asString copyUpTo: Character cr.
			place name: (name)."
