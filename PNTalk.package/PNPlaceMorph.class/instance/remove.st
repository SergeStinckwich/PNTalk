new
remove

"	place delete."
	owner removePlaceMorph: self.
	owner model removePlace: model.
	self delete.
	"
	netUI removeMorph: self.
	self pasteUpMorphOrWorld removeMorph: label.
	"