menu
newMenu
	"subclasses may return nil"
  | newMenu |
  self isFolder ifFalse: [ ^nil ].
  newMenu:=MenuMorph new.
  newMenu add: 'folder' target: self selector: #newFolder.
  newMenu addLine.
  newMenu add: 'text document' target: self selector: #newDocument.
  newMenu add: 'LaTeX document' target: self selector: #newLaTeXDocument.
  newMenu add: 'simulation' target: self selector: #newSimulation.
  newMenu add: 'prototype or trait object' target: self selector: #newPrototypeObject.
  newMenu add: 'PNtalk class' target: self selector: #newPNClass.
  ^ newMenu