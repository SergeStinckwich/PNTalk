as yet unclassified
pasteAction

	| obj aSymbol |
	obj := MyRepository getClipboardObjectCopy.
	obj ifNotNil: [
		aSymbol := self assureComponentName: (obj name).
		aSymbol ifNotNil: [
   	  		self addComponents: { aSymbol -> obj } ] ].
