place testing
unlockFrom: anArc

	| context |
	"Context: [1] index of last tested item; [2] a pair value->mult of last locked item by anArc"
	context := listContext at: anArc ifAbsent: [ ^ self ].
	self unlock: context.
	context at: 1 put: 0.
