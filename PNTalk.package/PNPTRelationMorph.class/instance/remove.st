event handling
remove

	model remove.
	owner removeRelationMorph: self.
	self delete.
	"
	netUI removeMorph: self.
	self pasteUpMorphOrWorld removeMorph: label.
	"