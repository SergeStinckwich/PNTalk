copying
shallowCopy

	| o |
	o := super shallowCopy.

	o instVarNamed: 'idGen' put: idGen copy.
	o instVarNamed: 'components' put: components.
	
	^ o.