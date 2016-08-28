as yet unclassified
newMenu
  | newMenu |
  newMenu := MenuMorph new.
  newMenu add: 'folder' target: self selector: #newFolder.
  newMenu add: 'text document' target: self selector: #newDocument.
  ^ newMenu