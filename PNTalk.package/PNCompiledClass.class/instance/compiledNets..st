compiler
compiledNets: aNets

	aNets do: [:net | self addCompiledNet: net ].
