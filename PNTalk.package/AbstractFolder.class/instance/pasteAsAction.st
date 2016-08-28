as yet unclassified
pasteAsAction

	| obj aSymbol str |
	obj := MyRepository getClipboardObjectCopy.
	obj ifNotNil: [
		str := UIManager default request: 'Paste as:' initialAnswer: obj name asString.
		str ~= '' ifTrue: [
			aSymbol := self assureComponentName: str.
			aSymbol ifNotNil: [
				self addComponents: { aSymbol -> obj } ] ] ].
