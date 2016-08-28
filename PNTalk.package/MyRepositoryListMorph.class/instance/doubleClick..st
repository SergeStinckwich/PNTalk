as yet unclassified
doubleClick: event
	| aMorph |
	doubleClickSelector isNil ifTrue: [^super doubleClick: event].
     aMorph := self itemFromPoint: event position.
	(aMorph notNil and:[aMorph inToggleArea: (aMorph point: event position from: self)])
	ifTrue:
	[
	  ^super doubleClick: event
	].
     aMorph ifNil: [^super doubleClick: event].
	^self model perform: doubleClickSelector