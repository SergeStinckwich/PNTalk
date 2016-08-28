as yet unclassified
description

	| str w |
	str := '"The Dubug Guide
==================

Note: The strings that are presented between letters [[ and ]] are ready to do-it (or inspect-it) action.

To debug, command ''self halt'' can be placed anywhere in actions of transitions. Example of using halt is presented in the class ExampleHalt - its listing follows:

class ExampleHalt is_a PN
object
	place p1(1`#e)
	trans t1
		precond p1(1`#e)
		action {
			self halt . 
                  Transcript show: ''continue'' . 
                  Transcript cr . 
            }

To execute example:
      [[
	exampleClass := MyRepository objectWithPathName: ''/PNtalk classes/ExampleHalt''.
	exampleObj := exampleClass newIn: (PNtalkSimulation default world).
      ]]
	
During simulation the debug window will be opened. It is possible to inspect simulation, resume simulation, or stop simulation.
"'.

	w := Workspace new.	
	w acceptContents: str.	
	w openLabel: 'PNtalk: The PNtalkServer Guide'.
