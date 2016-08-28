as yet unclassified
addDelegate: anObject

	"This method is the exact copy of TraitList>>addDelegate:."
	"TODO: merge methods into common place, maybe PrototypeObjectWithSources?"
	
	self addDelegate: anObject withName: (anObject name asString).