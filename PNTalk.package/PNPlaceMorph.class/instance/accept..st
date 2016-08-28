event handling
accept: aText

	| src m |
	src := aText asString.
	m := PNParser new compileMarks: src.
	model clearMark.
	m notNil ifTrue: [ model iMark: m. ].
"			name := aText asString copyUpTo: Character cr.
			place name: (name)."
