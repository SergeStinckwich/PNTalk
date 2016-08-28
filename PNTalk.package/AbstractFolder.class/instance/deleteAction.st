as yet unclassified
deleteAction

	(UIManager default confirm: 'All information contained in the object will be lost! Really DELETE ?')
		ifTrue: [ self parent removeComponents: (Array with: self name) ].