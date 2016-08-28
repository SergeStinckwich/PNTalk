processing
performDomainMessage: aMsg
	"The message is performed in new process because the operation atomicity is not ensured."
	| result |
	[ 
		result := inner perform: (aMsg selector) withArguments: (aMsg arguments).
		(aMsg sender) thisMessageFinished: aMsg with: result.
"	] fork."
	] forkAt: (PNObject priority + 2).
"	] forkAt: (Processor userBackgroundPriority)."

	^ aMsg.
