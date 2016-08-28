processing
destroy

	postArcGoals do: [ :goal | goal fire: variables ].
	self process removeThread: self. 
	self parent removeComponent: self.