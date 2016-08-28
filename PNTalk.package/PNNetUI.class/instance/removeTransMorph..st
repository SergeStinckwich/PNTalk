accessing
removeTransMorph: aMorph

	| m arcs |
	model removeTransition: aMorph model.
	transMorphs remove: aMorph.
	
	m := aMorph model.
	arcs := m conditions, m preConditions, m postConditions.

	arcs do: [ :a || l mm |
		l := arcMorphs select: [ :am | am model arc = a ].
		mm := l at: 1.
		mm delete.
		arcMorphs remove: mm.		
	].