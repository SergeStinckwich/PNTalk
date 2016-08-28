stat
printStatAsTableFor: type

	| str w |
	str := ''.
	w := stat select: [:item | (item at: 1) = type].
	w do: [:item |
"		str := str, (item at: 1) printString, String tab."
		str := str, (item at: 2) printString, String tab.
		str := str, (item at: 3) printString, String tab.
		str := str, String cr.
	].
	^ str.
