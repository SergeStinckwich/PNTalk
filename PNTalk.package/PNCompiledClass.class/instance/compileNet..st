compiler
compileNet: aSrc

	| m |

"	["
		m := PNParser new compileMethod: aSrc.
		self addCompiledNet: m.
"	] 
	on: Exception
	do: [ self inform: 'Parse error'. ^false ].
"
	^true