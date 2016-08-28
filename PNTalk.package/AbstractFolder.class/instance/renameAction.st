as yet unclassified
renameAction
	| str |
	str := UIManager default request: 'Rename' initialAnswer: self name asString.
	str > '' ifTrue: [ self renameTo: str ]
