menus
getMenu

	| newMenu |
	newMenu := MenuMorph new.
	newMenu defaultTarget: self.
	newMenu add: 'rename' action: #rename.
	newMenu addLine.
	newMenu add: 'remove' action: #remove.
	^newMenu