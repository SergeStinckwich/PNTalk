lexing
lchar

| ac |

back isNil 
	ifFalse: [
		ac := back. back := nil.
	]
	ifTrue: [
		ac := fnstream next.
	].

achar := ac.
^achar