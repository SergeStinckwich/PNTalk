as yet unclassified
assureComponentName: aName
	"Checks wheter the a component with the name aName already exists. If yes, it asks for a new name. In case of success, returns the new name otherwise returns nil."

	| str |
	(self componentNames includes: aName)
		ifTrue: [
			str := UIManager default 
				request: 'Name already in use. Specify another one.' 
				initialAnswer: (aName asString).
			str = '' 
				ifTrue: [ ^nil ]
     			ifFalse: [ ^self assureComponentName: (str asSymbol) ] ].
	^ aName.
