processing
performDomainMessage: aMsg
	"Perform a message from PNtalk. The operation is not blocking and the return value will be carried back by indenpendent channel."
	^ inner performDomainMessage: aMsg.