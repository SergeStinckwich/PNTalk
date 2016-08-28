accessing
objectWithOldID: anOld

	| newID obj |
	world isNil ifTrue: [ ^ nil ].
	
	newID := self oldID: anOld.
	obj := newID notNil
		ifTrue: [ world componentID: newID ]
		ifFalse: [ world componentID: anOld ]. 
	^ obj.