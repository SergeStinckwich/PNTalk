simulation control
destroy
 
	self prepareToStop.	
	world destroy.
	parent isNil ifFalse: [ parent removeComponents: (Array with: name) ].
