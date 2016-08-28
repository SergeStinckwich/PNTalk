state
loadState: state translator: translator

	"(name, content)
	content :- ( item* )
	item :- (mult->obj)
	obj :- (#ref->ID) | (#obj->object)"

	name := state at: 1.
	
	self clear.
	
	(state at: 2) do: [:pair || mult objs obj |
		mult := pair key.	
		objs := pair value.
		obj := (objs key = #obj) 
			ifTrue: [ objs value]
			ifFalse: [ 
				(objs key = #ref)
					ifFalse: [ nil ]
					ifTrue: [ | o |
						o := translator objectWithOldID: (objs value).
						o notNil
							ifTrue: [ o newProxy ] 
							ifFalse: [ o := PNtalkProxy new id: (objs value). translator addFreeProxy: o. o. ].
					].
			].
		self add: obj mult: mult.
	].
