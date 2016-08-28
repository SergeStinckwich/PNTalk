as yet unclassified
addExistingDelegate

	"This method is the exact copy of TraitList>>addExistingDelegate."
	"TODO: merge methods into common place, maybe PrototypeObjectWithSources?"
	
	(MyRepository 
		menuOfAllSimSpacesWithTarget: self 
		selector: #addDelegate: 
		root: (MyRepository at: 'DEVSTraitsAndPrototypes' ifAbsent: [MyRepository root]) 
		classList: PrototypeObjectForMyRepository) 
		popUpInWorld.