processing
performFor: aValues

	| index bind variables |
	self parent parent parent parent reportStream nextPutAll: ('fire port ', name, ' -- ', (self parent parent yourClass name), '(', (self parent parent id printString), ')', String cr).

"
	index := 0.
	binding := PNtalkDictionary new.
	formalParams do: [ :param || np |
		index := index + 1.
		np := aValues at: index.
		binding at: param put: np.
	].
"

	index := 1.
	variables := aValues at: index.
	arcGoals do: [ :goal | goal fire: variables ].
	"+ synchronni porty ..."
	guardGoals do: [ :goal | 
		index := index + 1.
		bind := aValues at: index.
		goal fireFor: variables bindings: bind.
	].
	postArcGoals do: [ :goal | goal fire: variables ].

"
	binding := aValues at: 1.
	arcGoals do: [ :goal | goal fire: binding ].
	""+ synchronni porty ...""
	guardGoals do: [ :goal | goal fire: binding ].
	postArcGoals do: [ :goal | goal fire: binding ].

"