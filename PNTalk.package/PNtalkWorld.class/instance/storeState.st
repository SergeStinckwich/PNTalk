NEW state
storeState	
	| st store |	
		
	st := OrderedCollection new.
	components do: [:c | st addLast: c getState ].
	
	self halt.
	
	store := SixxWriteStream new.	
	store newFileNamed: 'pokus.six'.
	store nextPut: st.	
	store close.
	
	^ st.