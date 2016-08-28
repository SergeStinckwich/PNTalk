event handling
addTransition

	| name trans |

	name := UIManager default request: 'new transition name' initialAnswer: ''.
" str := self assureComponentName: str.
  str~='' & str notNil ifTrue: [ self addComponents: {str -> PNCompiledClass new} ].
"
	trans := PNCompiledTransition new name: name.
	self drawTransition: trans.
	model addTransition: trans.
	
"
  name~='' ifTrue:
  [
	((cdevs inputPortExists: name) | (cdevs outputPortExists: name)) 
	ifTrue:
	[
	  PopUpMenu inform: 'This port already exists!'.
	]
	ifFalse:
	[
	  cdevs addInputPortNamed: (name asSymbol).
	  self addMorph: (MovablePortMorph getInputPortWithName: name).
	].
  ].
"