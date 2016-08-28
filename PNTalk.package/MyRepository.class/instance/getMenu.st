menu
getMenu
  | myMenu newMenu importMenu |
  myMenu:=MenuMorph new.
  "self isFolder ifFalse:" (self species canUnderstand: #open) ifTrue: [ 
	myMenu add: 'open' target: self selector: #open.
  	myMenu addLine ].
  newMenu:=self newMenu.
  newMenu ifNotNil: [ 
	myMenu add: 'new' subMenu: newMenu target: self selector: #yourself argumentList: #().
  	myMenu addLine ].
  myMenu add: 'copy' target: self selector: #copyToClipboard.
  parent ifNotNil: [ myMenu add: 'cut' target: self selector: #cutAction ].
  self isFolder ifTrue: [ myMenu add: 'paste' target: self selector: #pasteAction ].
  self isFolder ifTrue: [ myMenu add: 'paste as ...' target: self selector: #pasteAsAction ].
  parent ifNotNil: [ myMenu add: 'rename' target: self selector: #renameAction ].
  parent ifNotNil: [ myMenu add: 'delete' target: self selector: #deleteAction ].
  myMenu addLine.
  myMenu add: 'make SAR' target: self selector: #makeSAR.
  myMenu add: 'file out ...' target: self selector: #fileOutAction.
  self isFolder ifTrue: [ myMenu add: 'file in ...' target: self selector: #fileInAction ].
  self isFolder ifTrue: [ myMenu add: 'file into simulation ...' target: self selector: #fileIntoSimulationAction].
  myMenu addLine.
"  myMenu add: 'store as a method ...' target: self selector: #installStoreStringAsMethodAction.
  self isFolder ifTrue: [ myMenu add: 'file in using a method ... ' target: self selector: #fileInFromMethodAction ].
  myMenu addLine. "
  importMenu:=self importMenu.
  importMenu ifNotNil: [ 
	myMenu add: 'import' subMenu: importMenu target: self selector: #yourself argumentList: #().
  	myMenu addLine ].
  myMenu add: 'inspect' target: self selector: #inspect.
  ^myMenu