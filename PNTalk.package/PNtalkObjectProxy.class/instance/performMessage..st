processing
performMessage: aMsg
	"Perform a message from Smalltalk. The operation is blocking till the called method will be finished."
	inner performDomainMessage: aMsg.
	^ waitQueue next.