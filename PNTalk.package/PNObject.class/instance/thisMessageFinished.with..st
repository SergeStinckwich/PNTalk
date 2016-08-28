accessing
thisMessageFinished: aMsg with: aRetVal

	self performMessage: 
		(PNtalkMessage new selector: #dThisMessageFinished:with: withArguments: (Array with: aMsg with: aRetVal)).
