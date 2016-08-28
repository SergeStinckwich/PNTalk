domain processing
intStep

	| runnableObjects |

	self printToReportStream: ('Step in world ', self id printString, String cr).

"	activity := true."
	self releaseTimedEvents.
	
	runnableObjects := self getExecutableObjects.
	runnableObjects isEmpty
		ifFalse: [
			runnableObjects values do: [ :object | object isActive ifTrue: [ object simulationStep ]].
			"pred provedenim kroku se musi provest test - kroky v jinych objektech mohly zmenit navazani
			 je treba udelal inkrementalni testovani!"
"			runnableObjects values do: [ :object | object test. object isActive ifTrue: [ object dStep ]]."
			self dTest.
			^ true.
		].
	^ false.
