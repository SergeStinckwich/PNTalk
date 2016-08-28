as yet unclassified
yellowButtonActivity: shiftKeyState
	| menu |
	(menu := self getMenu: shiftKeyState) ifNotNil:
		[menu popUpEvent: self activeHand lastEvent in: self world]