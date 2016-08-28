as yet unclassified
mouseDown: evt
	| aMorph selectors |
	aMorph := self itemFromPoint: evt position.
	(aMorph notNil and:[aMorph inToggleArea: (aMorph point: evt position from: self)])
		ifTrue:[^self toggleExpandedState: aMorph event: evt]. 
	evt yellowButtonPressed  "First check for option (menu) click"
		ifTrue: 
		[
			(self model perform: getSelectionSelector) 
			ifNil:
			[
				^self
			]
			ifNotNil:
			[
				^ self yellowButtonActivity: evt shiftPressed
			].
		].
	aMorph ifNil:[^super mouseDown: evt].
	aMorph highlightForMouseDown.
	selectors := Array 
		with: #click:
		with: #doubleClick:
		with: nil
		with: (self dragEnabled ifTrue:[#startDrag:] ifFalse:[nil]).
	evt hand waitForClicksOrDrag: self event: evt selectors: selectors threshold: 10 "pixels".
