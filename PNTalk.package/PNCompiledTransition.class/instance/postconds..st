compiler
postconds: aList
	
"	self processList: aList to: postcondsList."
	| cond |
	self processList: aList for: [ :place :pair |
		cond := PNCompiledCondition new asPostcondition place: place; arc: pair.
		postcondsList addLast: cond.
	].
	^ cond.
	