drawing
drawPort: aTrans
	"draws the class aCDClass"
	| netMorph |
	netMorph := self morphForPort: aTrans.
	self addMorph: netMorph.
	netMorph position: self bounds origin + ((10 + (r nextInt: 400)) @ (10 + (r nextInt: 400))).
	^netMorph