menu
importMenu
	"subclasses may return nil"
  | m |
  self acceptsFiles ifTrue: [   
		m:=MenuMorph new.
		m add: 'import file ...' target: self selector: #importFile.
		m add: 'import all files from directory ...' target: self selector: #importAllFilesFromDirectory.
		m add: 'import directory ...' target: self selector: #importDirectory ].
 ^ m
