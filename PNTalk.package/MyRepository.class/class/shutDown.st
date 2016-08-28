as yet unclassified
shutDown
	SimulationsToWakeUpAtStart := self simulations select: [ :s | s isRunning ].
	SimulationsToWakeUpAtStart do: [ :s | Transcript show: 'Stopping simulation ...'; cr. s stop ].	
