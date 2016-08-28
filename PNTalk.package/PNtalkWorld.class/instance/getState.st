NEW state
getState	
		
	| st |
	st := OrderedCollection new.
	components do: [:c | st addLast: c getState ].
	^ st.