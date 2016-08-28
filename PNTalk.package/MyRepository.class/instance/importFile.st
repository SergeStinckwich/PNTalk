menu actions
importFile

	| filename obj aSymbol filestream |
	filestream := FileList2 modalFileSelector.
	filestream ifNil: [^self].
	filename := filestream localName.
	obj := filestream binary; contentsOfEntireFile.
	obj ifNotNil: [
		aSymbol:=self assureComponentName: filename.
		aSymbol ifNotNil: [ self addComponents: { aSymbol -> (ImportedFile contents: obj) } ] ].
