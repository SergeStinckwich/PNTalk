event handling
addPlace

	| name place |

	name := UIManager default request: 'new place name'.
	place := PNCompiledPlace new name: name.
	self drawPlace: place.
	model addPlace: place.
	
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