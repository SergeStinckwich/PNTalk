event handling
accept: aText from: aMorph

"	super accept: aText from: aMorph."
	
	aMorph == (self textMorphAt: 1)
		ifTrue: [ | src m |
			src := aText asString.
			m := PNParser new compileMarks: src.
			model clearMark.
			m notNil ifTrue: [ model iMark: m. ].
"			name := aText asString copyUpTo: Character cr.
			place name: (name)."
		].
