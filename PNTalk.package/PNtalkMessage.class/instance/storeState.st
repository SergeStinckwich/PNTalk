state
storeState

	| st items |
	"id messageName senderID receiverID type arguments"
	st := OrderedCollection new.
	st addLast: self id.
	st addLast: message.
	st addLast: (sender notNil ifTrue: [sender id] ifFalse: [nil]).
	st addLast: (receiver notNil ifTrue: [receiver id] ifFalse: [nil]).
	st addLast: type.
	items := OrderedCollection new.
	st addLast: items.
	arguments do: [:arg |
		(arg isKindOf: PNtalkProxy) 
			ifTrue: [ items addLast: (#ref->(arg id)) ]
			ifFalse: [ items addLast: (#obj->arg) ].
	].
	
	^ st.