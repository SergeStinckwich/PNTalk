as yet unclassified
getMenu

  | myMenu |

  myMenu:=MenuMorph new.
  myMenu addTitle: 'Object'.
  myMenu add: 'open' target: self selector: #inspect.
  myMenu addLine.
  myMenu add: 'add existing delegate' target: self selector: #addExistingDelegate.
  myMenu add: 'ref. paste' target: self selector: #pasteDelegate.
  myMenu addLine.
  myMenu add: 'copy' target: self selector: #copyToClipboard.
  myMenu add: 'cut' target: self selector: #cutAction.
  myMenu add: 'rename' target: self selector: #renameAction.
  myMenu add: 'delete' target: self selector: #deleteAction.
  myMenu addLine.
  myMenu add: 'file out ...' target: self selector: #fileOutAction.

  ^myMenu
