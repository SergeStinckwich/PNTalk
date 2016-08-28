instance creation
collectPlacesFrom: aClass 
	""

	| coll superCls |

	superCls := aClass yourSuperClass.
	coll := superCls isNil
		ifFalse: [ superCls objectNet collectPlacesFrom: superCls. ]
		ifTrue: [ Dictionary new ].

	placesList do: [ :item |
		coll at: (item name) put: item.
	].
	^coll.