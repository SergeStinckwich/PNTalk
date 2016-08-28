instance creation
collectTransitionsFrom: aClass 
	""

	| coll superCls |

	superCls := aClass yourSuperClass.
	coll := superCls isNil
		ifFalse: [ superCls objectNet collectTransitionsFrom: superCls. ]
		ifTrue: [ Dictionary new ].

	transitionsList do: [ :item |
		coll at: (item name) put: item.
	].
	^coll.