menu actions
importDirectory

	| directory aSymbol dirname obj |
	directory := FileList2 modalFolderSelector.
	directory ifNil: [^self].
	dirname := directory pathParts last.
	aSymbol := self assureComponentName: dirname.	
	aSymbol ifNotNil: [
		obj := (ImportedDirectory new importFrom: directory ; yourself). 
		self addComponents: { aSymbol -> obj } ].


