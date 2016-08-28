drawing
getMenu

	| addMenu newMenu importMenu |
	addMenu := MenuMorph new.
	addMenu defaultTarget: self.
	addMenu add: 'place' action: #addPlace.
	addMenu add: 'transition' action: #addTransition.
	addMenu addLine.
	addMenu add: 'condition' action: #addCondition.
	addMenu add: 'precondition' action: #addPreCondition.
	addMenu add: 'postcondition' action: #addPostCondition.
	addMenu addLine.
	addMenu add: 'sync port' action: #addSyncPort.
	addMenu add: 'inhibitor' action: #addInhibitor.	

	importMenu := MenuMorph new.
	importMenu defaultTarget: self.
	importMenu add: 'place' action: #importPlace.
"	importMenu add: 'transition' action: #importTransition."

	newMenu := MenuMorph new.
	newMenu defaultTarget: self.
	newMenu add: 'add' subMenu: addMenu target: self selector: #yourself argumentList: #().
	newMenu add: 'import' subMenu: importMenu target: self selector: #yourself argumentList: #().
	newMenu addLine.
	newMenu add: 'save' action: #save.
	^newMenu