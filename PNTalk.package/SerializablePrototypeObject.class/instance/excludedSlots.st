as yet unclassified
excludedSlots

	^ self slotNames select: [ :n | n asString beginsWith: 'X' ].