active processing
processMessage: msg

	| return |

	methodContext := msg getMethodContextFor: self.
	return := self performMessage: msg in: methodContext.
	listProcesses add: methodContext.

	methodContext isWaiting
		ifTrue: [ listInvocatedMethods at: (methodContext message) put: methodContext ]
		ifFalse: [ methodContext finish: return ].

	methodContext := nil.

"
	| methodContext return |

	methodContext := msg getMethodContextFor: self.
	return := slave performMessage: msg in: methodContext.
	listProcesses add: methodContext.

	methodContext isWaiting
		ifTrue: [ listInvocatedMethods at: (methodContext message) put: methodContext ]
		ifFalse: [ methodContext finish: return ].

"