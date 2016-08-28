as yet unclassified
name

	| n |
	self nameInSimSpace size > 0 
		ifTrue: [ n := self nameInSimSpace ] 
		ifFalse: [ n := 'a Prototype Object' ].
	^ n