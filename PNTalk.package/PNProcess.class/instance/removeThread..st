accessing
removeThread: aThread

	threads removeKey: (aThread id) ifAbsent: [ self error: 'removeThread: thread not found: ' ].