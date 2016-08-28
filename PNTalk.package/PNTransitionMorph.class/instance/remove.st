new
remove

"	transition delete."
	owner removeTransMorph: self.
	self delete.
	"
	netUI removeMorph: self.
	self pasteUpMorphOrWorld removeMorph: label.
	"