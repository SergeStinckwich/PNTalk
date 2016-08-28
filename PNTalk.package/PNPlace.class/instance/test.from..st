place testing
test: aPair from: anArc

	| context |
"	t1 := Time millisecondClockValue."
	
	"Context: [1] index of last tested item; [2] a pair value->mult of last locked item by anArc"
	context := listContext at: anArc ifAbsent: [ nil ].
	context isNil
		ifTrue: [
			context := Array with: 0 with: 0->0. 	
			listContext at: anArc put: context.
		].
	^ self test: aPair for: context.
"
	t2 := Time millisecondClockValue.
	Transcript nextPutAll: 'place ', name, ':', (t2 -t1) printString; cr. 
	
	^ r.
	"