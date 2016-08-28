instance creation
inheritedPlaces
	""

	| coll superCls |

	superCls := self parent yourSuperClass.
	coll := superCls isNil
		ifFalse: [ superCls objectNet collectPlacesFrom: superCls. ]
		ifTrue: [ Dictionary new ].
	^ coll.