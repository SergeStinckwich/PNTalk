state
storeState

	| st items |
	"(name, content)
	content :- ( item* )
	item :- (mult->obj)
	obj :- (#ref->ID) | (#obj->object)"
	st := OrderedCollection new.
	st addLast: name.
	items := OrderedCollection new.
	st addLast: items.
	content associationsDo: [:pair || obj mult |
		obj := pair key.
		mult := pair value.		
		(obj isKindOf: PNtalkProxy) 
			ifTrue: [ items addLast: mult->(#ref->(obj id)) ]
			ifFalse: [ items addLast: mult->(#obj->obj) ].
	].
	^ st.