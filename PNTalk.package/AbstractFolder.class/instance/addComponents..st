as yet unclassified
addComponents: associations

	associations do: [ :a | self addComponent: a value named: a key ].
	(MyRepository root) changed: #hierarchicalList.
