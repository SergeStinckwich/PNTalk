as yet unclassified
printFirableTransAndThreadsOfWorld: world

	Transcript cr; show: 'Transitions and threads that can be performed:'; cr.
	
	"The message componentsDo: evaluates given block with each of the receiver's elements as the argument. Thus, following message sending evaluates
	the block with each objects placed in the world."
	world componentsDo: [ :object |
		
		"Now we evaluate the block with each processes in the object."
		object componentsDo: [ :process || i |
			
			"The message master over the process returns the superior metaobject (metaobject of the OOPN object in this case). The message id returns 
			the unique identification of metaobjects."
			Transcript show: 'object ', (process master id printString); show: ': process '; show: (process id); cr.
			
			"Each process has transitions and threads. Some of them can be performed at the current time. To get a collection of firable transition the following
			message can be sent to the metaobject representing a process."
			process listFirableTransitions do: [ :event |
				Transcript show: '  >>'; show: (event id printString), ': '; show: event name; cr.
				i := 0.
				
				"Each firable transition has a collection of bindings (the binding is a collection of places and variables for them the transition can be fired at the current time)."
				event listBindings do: [ :bind |
					i := i + 1.
					Transcript show: '    >>'; show: i printString, ': ';show: (bind printString); cr.
				].
			].
			"To get a collection of firable threads the following message can be sent to the metaobject representing a process."
			process listFirableThreads do: [ :event |
				Transcript show: '  >>'; show: (event superComponent id printString), ': '; 
					show: (event id printString), ': ';show: (event printString); cr.
			].
		].
	].