clipboard
getClipboardObjectCopy

  "get a COPY of the clipboard object"
  (ClipboardObject isKindOf: BaseDEVS) ifTrue:
  [
	^ ClipboardObject safeCopy.
  ]
  ifFalse:
  [
	^ ClipboardObject copy.
  ].