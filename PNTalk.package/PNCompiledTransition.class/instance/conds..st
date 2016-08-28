compiler
conds: aList
	
"	self processList: aList to: condsList."
	| cond |
	self processList: aList for: [ :place :pair |
		cond := PNCompiledCondition new asCondition place: place; arc: pair.
		condsList addLast: cond.
	].
	^ cond.