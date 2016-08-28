compiler
preconds: aList
	
"	self processList: aList to: precondsList."
	| cond |
	self processList: aList for: [ :place :pair |
		cond := PNCompiledCondition new asPrecondition place: place; arc: pair.
		precondsList addLast: cond.
	].
	^ cond.
	