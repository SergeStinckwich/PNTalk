state
clear
	content copy keysDo: [:key | content removeKey: key]..
	orderedContent removeAllSuchThat: [:item | true ].