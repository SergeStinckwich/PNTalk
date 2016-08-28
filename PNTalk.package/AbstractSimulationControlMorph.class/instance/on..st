as yet unclassified
on: aSimulation

	| logMenu simulationMenu |
	model := aSimulation.

	logMenu:=MenuMorph new.
	logMenu add: ' - ' target: self selector: #setReportStream: argument: (DummyStream on: nil).
	logMenu add: 'Transcript' target: self selector: #setReportStream: argument: Transcript.
	logMenu add: 'File' target: self selector: #setReportStreamToFile.

	simulationMenu:=MenuMorph new.
	simulationMenu title: 'Simulation menu'.
  	simulationMenu add: 'copy simulation' target: model selector: #copyAction.
  	simulationMenu add: 'cut simulation' target: model selector: #cutAction.
  	simulationMenu add: 'delete simulation' target: model selector: #remove.
  	simulationMenu add: 'rename simulation' target: model selector: #renameAction.
   	(model isKindOf: DEVSRootSolver) ifTrue: [ 
		simulationMenu add: 'paste root DEVS' target: model selector: #pasteRootDEVS ].
	simulationMenu addLine.
  	simulationMenu add: 'make SAR' target: model selector: #makeSAR.
	simulationMenu addLine.
  	simulationMenu add: 'open simulation control buttons' target: self selector: #openSimControlButtons.
	simulationMenu addLine.
	simulationMenu add: 'inspect simulation' target: model action: #inspect.

	self title: 'Simulation'.
	self addStayUpItem.
	self defaultTarget: self.

	self addSubMenuUpdating: #modelWording enablementSelector: #true target: self subMenu: self getModelMenu.
	self add: 'Simulation' subMenu: simulationMenu target: self selector: #yourself argumentList: #().
	self addLine.
	self addUpdating: #startWording enablement: #startEnabled action: #start.
	self addUpdating: #stopWording enablement: #stopEnabled action: #stop.
	self addLine.
	self addUpdating: #resetWording enablement: #true action: #reset.
	self addLine.
	self addUpdating: #rtFactorWording enablement: #true action: #setRTFactor.
	self addUpdating: #stopTimeWording enablement: #true action: #setStopTime.
	self addSubMenuUpdating: #logWording enablementSelector: #true target: self subMenu: logMenu.

	^self
