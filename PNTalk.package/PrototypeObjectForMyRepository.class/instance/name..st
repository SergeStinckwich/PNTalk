as yet unclassified
name: n

	(self nameInSimSpace size > 0) & (self nameInSimSpace ~= n)
		ifTrue: [ self nameInSimSpace: n ] 
