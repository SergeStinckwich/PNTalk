as yet unclassified
description

	| str w |
	str := '"The State Manipulation Guide
==================

Note: The strings that are presented between letters [[ and ]] are ready to do-it (or inspect-it) action.

PNtalk offers protocol for state manipulation including simulation control. We will follow the example of Ackermann function.

*** To get class and to create simulation, we can use following messages from protocol:
[[ ackClass := MyRepository objectWithPathName: ''/PNtalk classes/Ackermann''. ]]
[[ sim := PNtalkSimulation newNamed: ''Testing''. ]]
[[ ack1 :=  ackClass newIn: (sim world). ]]

*** To start | stop | destroy simulation:
[[ sim start ]]
[[ sim stop ]]
[[ sim destroy ]]

*** To step simulation (if the simulation is stoped):
[[ sim step ]]

*** To test simulation (if the simulation is stoped and any change has been done):
[[ sim test ]]

*** To call method from Smalltalk (it is needed to call method from another process; if the simulation would be stoped, the main process will not block):
[[ [ res := ack1 x: 2 y: 3. Transcript show: ''Result is '', res printString; cr. ] fork. ]]

*** To get state of simulation or object (if the simulation is stoped):
[[ PNtalkSimulation default world getStateXML ]]
[[ ack1 reify getState ]]

"'.

	w := Workspace new.	
	w acceptContents: str.	
	w openLabel: 'PNtalk: The State Manipulation Guide'.
