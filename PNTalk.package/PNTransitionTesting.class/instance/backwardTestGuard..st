processing
backwardTestGuard: aStack

	| goal |

	aStack isEmpty ifTrue: [ 
		(arcGoals size = 0)
			ifTrue: [ ^ Result createFail ]	"pokud sjedeme zpatky pri testovani strazi a nejsou vstupni hrany, koncime "
			ifFalse: [ ^ self test ]
	].

	goal := aStack get.
	goal isBoolean ifTrue: [
		aStack pop.
		guardsBindings removeLast.
		^ self backwardTestGuard: aStack.
	].

	^ self forwardTestGuard: aStack.