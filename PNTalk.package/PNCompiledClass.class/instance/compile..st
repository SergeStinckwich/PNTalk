compiler
compile: aSrc

	| m |

"	["
		m := PNParser new compile: aSrc.
		m isClass 
			ifTrue: [
				self name: (m name).
				self superClassName: (m superClassName).
				self addCompiledNet: (m objectNet).
				portsList := Dictionary new.
				m portNames do: [ :n | self addCompiledNet: (m portNamed: n) ].
				^ true.
			].
		self addCompiledNet: m.
"	] 
	on: Exception
	do: [ self inform: 'Parse error'. ^false ].
"
	^true