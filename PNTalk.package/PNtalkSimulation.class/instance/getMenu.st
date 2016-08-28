GUI
getMenu

	| r a myMenu |
	r := self isRunning.
	a := self isActive.
	(r not | (r & a)) ifTrue: [ ^ AbstractSimulationControlMorph on: self ].

	myMenu:=MenuMorph new.
 	myMenu add: 'proceed' target: self world selector: #startSimulation.
 	myMenu add: 'stop' target: self selector: #stop.
  	myMenu addLine.
	
	^myMenu