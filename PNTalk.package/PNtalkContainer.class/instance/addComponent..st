accessing
addComponent: aComponent

	aComponent id isNil ifTrue: [ aComponent id: self nextID ].
	components at: aComponent id put: aComponent.
	aComponent parent: self.
	^ aComponent.
	
"	(MyRepository root) changed: #hierarchicalList."