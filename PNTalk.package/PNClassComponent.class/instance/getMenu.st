as yet unclassified
getMenu
  | myMenu |
  myMenu:=MenuMorph new.
  "self isFolder ifFalse:" (self species canUnderstand: #open) ifTrue: [ 
	myMenu add: 'open' target: self selector: #open.
  	myMenu addLine ].
  myMenu add: 'copy' target: self selector: #copyToClipboard.
  parent ifNotNil: [ myMenu add: 'cut' target: self selector: #cutAction ].
  self isFolder ifTrue: [ myMenu add: 'paste' target: self selector: #pasteAction ].
  self isFolder ifTrue: [ myMenu add: 'paste as ...' target: self selector: #pasteAsAction ].
  parent ifNotNil: [ myMenu add: 'rename' target: self selector: #renameAction ].
  parent ifNotNil: [ myMenu add: 'delete' target: self selector: #deleteAction ].
  myMenu addLine.
  myMenu add: 'make SAR' target: self selector: #makeSAR.
"  myMenu add: 'file out ...' target: self selector: #fileOutAction.
  self isFolder ifTrue: [ myMenu add: 'file in ...' target: self selector: #fileInAction ].
"  myMenu addLine.
  myMenu add: 'inspect' target: self selector: #inspect.
  ^myMenu