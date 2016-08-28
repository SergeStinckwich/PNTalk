NEW state
getStateXML
	| st store |	
		
	st := OrderedCollection new.
	components do: [:c | st addLast: c getState ].
	
	store := SixxWriteStream new.	
	store on: (WriteStream on: '').
	store nextPut: st.	
	^ store contents.
