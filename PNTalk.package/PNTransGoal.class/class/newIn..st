instance creation
newIn: aParent
	| obj |
	obj := super new.
	aParent addComponent: obj.
	^ obj.
"	^ super new parent: aParent."