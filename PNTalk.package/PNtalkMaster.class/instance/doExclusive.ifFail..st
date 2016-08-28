domain processing
doExclusive: aBlock ifFail: aFailBlock

	| ret |
	[ 	semaphore wait.
		ret := aBlock value.
		semaphore signal.
		^ ret.
	] on: Exception do: [ :ex |		
		(Halt handles: ex)
			ifTrue: [ self halt. ex resume. ]
			ifFalse: [ semaphore signal. ^ aFailBlock value. ]
	].