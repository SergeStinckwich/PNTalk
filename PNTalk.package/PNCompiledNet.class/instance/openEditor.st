as yet unclassified
openEditor

	netWindow isNil ifTrue: [
		netWindow := PNNetWindow new.
		netWindow initializeForNet: self.
"		netWindow netUI draw."
	].
	netWindow open.
