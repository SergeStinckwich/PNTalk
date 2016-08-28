processing
testArc: aStack

	| listV result goalsSize goal go position |

"	t1 := Time millisecondClockValue."
	
	goalsSize := arcGoals size.
	aStack isEmpty ifTrue: [
		(arcGoals size = 0)
			ifTrue: [ ^ true ]
			ifFalse: [
				goal := arcGoals at: 1. 
				goal variables: variables.
				aStack put: goal.
			].
		].

	go := true.
	position := aStack get position.
	[ go ]
		whileTrue: [
			goal := aStack get.
			result := goal test.
			result ifTrue: [
				listV := goal bindVariables.
				position := position + 1.
				(go := position <= goalsSize)
					ifTrue: [ aStack put: ((arcGoals at: position) variables: listV) ]
					ifFalse: [ aStack setSuccess. ].
			]
			ifFalse: [
				aStack pop.
				aStack setFail.
				position := position - 1.
				go := aStack notEmpty.
			].
		].
	
"	t2 := Time millisecondClockValue.
	Transcript nextPutAll: '~~~~ test arcs ~~~~ : ', (t2 -t1) printString; cr. "
	
	^ aStack success.