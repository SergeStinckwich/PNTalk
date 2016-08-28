accessing
initModel

	| obj cls mobj |
	"musi byt zastaveno"
	obj := self componentID: 1.
	cls := obj yourClass.
	self initialize.
	
	mobj := cls newIn: self.
	^ mobj reify.
	