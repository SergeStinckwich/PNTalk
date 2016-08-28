event handling
accept: aText from: aMorph

"	super accept: aText from: aMorph."
self shouldNotImplement.

	aMorph == (self textMorphAt: 1)
		ifTrue: [ | src a |
			src := aText asString.
			src := ' guard {', src, ' }'.
			a := PNParser new compileGuard: src.
			a notNil ifTrue: [ model guards: a. ].
"			name := aText asString copyUpTo: Character cr.
			place name: (name)."
		].
	aMorph == (self textMorphAt: 2)
		ifTrue: [ | src a |
			src := aText asString.
			src := ' action {', src, ' }'.
			a := PNParser new compileAction: src.
			a notNil ifTrue: [ model actions: a. ].
		].
