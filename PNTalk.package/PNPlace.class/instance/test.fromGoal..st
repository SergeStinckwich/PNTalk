new place testing
test: aPair fromGoal: aGoal

	| index result var |
"	t1 := Time millisecondClockValue."

	index := listContext at: aGoal ifAbsent: [0].
	result := Result createFail.
	content isEmpty ifTrue: [ ^ result ].
	var := aPair key.	
		
	(var hasValue & (index > 0)) 
		ifTrue: [ listContext removeKey: aGoal. ]
		ifFalse: [
			(var isEmpty | var isList) 
				ifFalse:	[ self testValue: aPair forGoal: aGoal index: index+1 result: result ]
				ifTrue: [ self testVariable: aPair forGoal: aGoal index: index result: result ].
			].

"	t2 := Time millisecondClockValue.
	Transcript nextPutAll: 'place ', name, ':', (t2 -t1) printString; cr. 
	"
	^ result