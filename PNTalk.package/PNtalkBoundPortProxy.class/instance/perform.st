accessing
perform
	
	message arguments: (bindings at: 1).
	^ inner performMessage: (PNtalkMessage new selector: #performBindedPort: withArguments: (Array with: message)).
