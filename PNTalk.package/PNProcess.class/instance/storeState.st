state
storeState	

	| pl st th |	
	"(name, id, places, threads)"
	st := OrderedCollection new.
	st addLast: name.
	st addLast: id.
"	pl := places collect: [ :place | place storeState ]."
	pl := places asOrderedCollection collect: [ :place | place storeState ].
	st addLast: pl.
"	th := threads collect: [ :trans | trans storeState ]."
	th := threads asOrderedCollection collect: [ :trans | trans storeState ].
	st addLast: th.
	^ st.