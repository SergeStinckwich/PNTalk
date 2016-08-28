as yet unclassified
privatePostClone
	super privatePostClone.
	self excludedSlots do: [ :n | self addSlot: n withValue: nil ].