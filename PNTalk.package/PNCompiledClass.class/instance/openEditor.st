as yet unclassified
openEditor

	classWindow isNil ifTrue: [
		classWindow := PNClassWindow new.
		classWindow initializeForClass: self.
"		classWindow classUI draw."
	].
	classWindow open.
