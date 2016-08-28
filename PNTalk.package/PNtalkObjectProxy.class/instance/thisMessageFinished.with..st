PNtalk processing
thisMessageFinished: aMsg with: result
	"Called message (aMsg) has been finished and its result can be carried back to the sender. If the sender is the proxy itself, it means the real sender is Smalltalk object."
	(aMsg sender = self)
		ifTrue: [ waitQueue nextPut: result. ]
		ifFalse: [ inner thisMessageFinished: aMsg with: result ].
