state
loadState: state to: aProcess

	"(transition:=name, id, action:=index, variables, valueQueue)
	variables :- ( item* )
	item :- (name->obj)
	obj :- (#ref->ID) | (#obj->object)"
	
	| transition items translator |
	translator := OrderedCollection new.

	self id: (state at: 2).
	transition := aProcess componentID: (state at: 1).
	transition addComponent: self.
	aProcess addThread: self.
	
	actionIndex := state at: 3.
	actions := transition actions.
	postArcGoals := transition postActions.
	
	items := state at: 4.
	items associationsDo: [:pair || obj objs n |
		n := pair key.
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
		variables at: n put: obj.
	].

	items := state at: 5.
	items associationsDo: [:pair || obj |
		obj := (pair key = #obj) 
			ifTrue: [ pair value]
			ifFalse: [ 
				(pair key = #ref)
					ifFalse: [ nil ]
					ifTrue: [ | o |
						o := translator objectWithOldID: (pair value).
						o notNil
							ifTrue: [ o newProxy ] 
							ifFalse: [ o := PNtalkProxy new id: (pair value). translator addFreeProxy: o. o. ].
					].
			].
		valueQueue addLast: obj.
	].
