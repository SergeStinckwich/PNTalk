processing
performFor: aBinding

	| thread bind binds index variables |
"Transcript show: 'fire ', (self master id printString); show: ':', (self name); cr."
	self parent parent parent parent reportStream nextPutAll: ('fire trans ', name, ' -- ', (self parent yourNet name), ' -- ', (self parent parent yourClass name), '(', (self parent parent id printString), ')', String cr).
		
	binds := aBinding bindings.
	variables := aBinding variables.
"	size := binds size."
	index := 1.
	bind := binds at: index.
	arcGoals do: [ :goal | goal fire: bind ].
	"+ synchronni porty ..."
	guardGoals do: [ :goal | 
		index := index + 1.
		bind := binds at: index.
		goal fireFor: variables bindings: bind.
	].

	thread := PNtalkThread newIn: self.
	self process addThread: thread.
	thread variables: aBinding variables.
	thread actions: actions.
	thread postActions: postArcGoals.
	thread perform.	

"	self superElement addThread: thread.

	arcGoals do: [ :goal | goal performFor: aBinding ].
	guardGoals do [ :goal | goal performFor: aBinding ].
	thread variables: aBinding.
"
