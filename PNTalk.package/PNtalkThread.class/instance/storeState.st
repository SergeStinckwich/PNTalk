state
storeState

	| st items vq |
	"(transition:=name, id, action:=index, variables, valueQueue)
	variables :- ( item* )
	item :- (name->obj)
	obj :- (#ref->ID) | (#obj->object)"
	st := OrderedCollection new.
	st addLast: parent name.
	st addLast: id.
	st addLast: actionIndex.
	items := OrderedCollection new.
	st addLast: items.
	variables associationsDo: [:pair || obj n |
		n := pair key.
		obj := pair value.		
		((obj isKindOf: PNtalkProxy) or: [obj isKindOf: PNtalkComponent]) 
			ifTrue: [ items addLast: n->(#ref->(obj id)) ]
			ifFalse: [ items addLast: n->(#obj->obj) ].
	].
	vq := OrderedCollection new.
	st addLast: vq.
	valueQueue do: [:item |
		((item isKindOf: PNtalkProxy) or: [item isKindOf: PNtalkComponent])
			ifTrue: [ vq addLast: #ref->(item id) ]
			ifFalse: [ vq addLast: #obj->item ].
	].
	^ st.