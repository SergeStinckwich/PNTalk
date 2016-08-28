repository
getMenu
  | myMenu |
  myMenu:=MenuMorph new.
  "self isFolder ifFalse:" (self species canUnderstand: #open) ifTrue: [ 
	myMenu add: 'open' target: self selector: #open.
	myMenu add: 'add method' target: self selector: #addMethodAction.
  	myMenu addLine ].
  myMenu add: 'create instance' target: self selector: #create.
  myMenu addLine.
  myMenu add: 'copy' target: self selector: #copyToClipboard.
  self parent ifNotNil: [ myMenu add: 'cut' target: self selector: #cutAction ].
  self isFolder ifTrue: [ myMenu add: 'paste' target: self selector: #pasteAction ].
  self isFolder ifTrue: [ myMenu add: 'paste as ...' target: self selector: #pasteAsAction ].
  self parent ifNotNil: [ myMenu add: 'rename' target: self selector: #renameAction ].
  self parent ifNotNil: [ myMenu add: 'delete' target: self selector: #deleteAction ].
  myMenu addLine.
  myMenu add: 'make SAR' target: self selector: #makeSAR.
  myMenu add: 'file out ..' target: self selector: #fileOutAction.
"  myMenu add: 'file out ...' target: self selector: #fileOutAction.
  self isFolder ifTrue: [ myMenu add: 'file in ...' target: self selector: #fileInAction ].
"  myMenu addLine.
  myMenu add: 'inspect' target: self selector: #inspect.
  ^myMenu