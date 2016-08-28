event handling
acceptAction: aText

	| src a |

	src := aText asString.
	src := ' action {', src, ' }'.
	a := PNParser new compileAction: src.
	a notNil ifTrue: [ model actions: a. ].
