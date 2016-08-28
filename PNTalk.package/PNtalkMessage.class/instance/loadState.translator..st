state
loadState: state translator: translator

	| |
	"id messageName senderID receiverID type arguments"
	id := state at: 1.
	message := state at: 2.
	(state at: 3) notNil ifTrue: [ sender := translator objectWithOldID: (state at: 3)].
	(state at: 4) notNil ifTrue: [ receiver := translator objectWithOldID: (state at: 4)].
	type := state at: 5.
	
	" je nutne obnovovat argumenty???? zatim ne, ale melo by to byt kompletni ..."
	"
	items := OrderedCollection new.
	arguments do: [:arg |
		(arg isKindOf: PNtalkProxy) 
			ifTrue: [ items addLast: (#ref->(arg id)) ]
			ifFalse: [ items addLast: (#obj->arg) ].
	].
	"