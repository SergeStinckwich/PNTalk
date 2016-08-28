as yet unclassified
removeComponents: compList

	compList do: [ :x |
		self removeComponentNamed: x ].
	(MyRepository root) changed: #hierarchicalList.
