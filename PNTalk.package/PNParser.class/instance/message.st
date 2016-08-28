parsing net
message

| bsel id1 dd |

id1 := self key.
id1 isNil 
	ifTrue: [
		id1 := self smId.
		id1 isNil ifFalse: [ 
			^Dictionary new at:#selector put: id1; at: #args put: (OrderedCollection new); yourself.
		].

		bsel := self binsel.
		id1 := self id.
	]
	ifFalse: [
		^self keyMessage: id1.
	].


dd := Dictionary new.
dd at: #selector put: bsel.
dd at: #arg put: id1.