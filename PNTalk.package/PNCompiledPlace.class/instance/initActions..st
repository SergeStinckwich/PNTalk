compiler
initActions: anActionsList
	
	anActionsList isNil ifFalse: [ 
		anActionsList do: [ :action | initActions addLast: action ].
	].