menu actions
importFrom: aFileDirectory

	| aSymbol obj file |
	aFileDirectory fileNames do: [ :fn | 
		aSymbol := self assureComponentName: fn.	
		file := (FileStream readOnlyFileNamed: (aFileDirectory fullNameFor: fn)) contentsOfEntireFile.
		aSymbol notNil & file notNil ifTrue: [
			self addComponents: { aSymbol -> (ImportedFile contents: file) } ]].
 	aFileDirectory directoryNames do: [ :fn | 
		aSymbol := self assureComponentName: fn.	
		aSymbol ifNotNil: [
			obj := (ImportedDirectory new 
				importFrom: (aFileDirectory directoryNamed: fn) ; 
				yourself). 
			self addComponents: { aSymbol -> obj } ]].
