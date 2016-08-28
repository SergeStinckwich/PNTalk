drawing
drawTransition: aTrans
	"draws the class aCDClass"
	| netMorph |
	netMorph := self morphForTransition: aTrans.
	self addMorph: netMorph.
	netMorph position: self bounds origin + ((10 + (r nextInt: 400))  @ (10 + (r nextInt: 400))).
	
	self drawArcsForTransition: aTrans.
"	model transitions do: [:each | self drawArcsForTransition: each]."
	
	^netMorph