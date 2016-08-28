as yet unclassified
description

	| str w |
	str := '"The PNtalk Server Guide
==================

Note: The strings that are presented between letters [[ and ]] are ready to do-it (or inspect-it) action.

*** PNtalkServer is the class implementing server for remote working with models and simulations. 
- [[PNtalkServer start]] - starts server on the port 9999
- [[PNtalkServer startOn: 8000]] - starts server on the specific port 8000
- [[PNtalkServer destroy]] - destroys server

*** Protocol description:
Protocol consists of commands having parts; each part is delimited by end of line <lf>.

= Adding class to remote repository
request: addClass <lf> -source code of the class-
response: OK | FAILED

= Creating simulation
request: newSim <lf> -name of the main class-
response: OK <lf> -ID of created simulation- | FAILED

= start | stop | step | destroy of simulation
request: startSim | stopSim | stepSim | destroySim <lf> -ID of simulation-
response: OK | FAILED

= simulation status inquiry
request: isActiveSim <lf> -ID of simulation-
response: true | false | FAILED

= getting simulation state
request: getState <lf> -ID of simulation-
response: OK <lf> -simulation state represented by XML document- | FAILED

"'.

	w := Workspace new.	
	w acceptContents: str.	
	w openLabel: 'PNtalk: The PNtalkServer Guide'.
