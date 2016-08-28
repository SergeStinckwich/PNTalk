as yet unclassified
reset
	(UIManager default confirm: 'State information of all model components will be lost! Reset anyway?')
		ifTrue: [ model asyncReset ].
