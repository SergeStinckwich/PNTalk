parsing net
parseNet
	| mess net |
	(#(#object #method #constructor #sync #inhibitor) includes: alex value) 
		ifFalse: [^nil].
	(alex isReserved: #object) 
		ifTrue: 
			[self expectedReserved: #object.
			net := self component.
			^PNCompiledObjectNet new content: net].
	(alex isReserved: #method) 
		ifTrue: 
			[self expectedReserved: #method.
			mess := self message.
			net := self component.
			^(PNCompiledNet new)
				name: (mess at: #selector);
				parameters: (mess at: #args);
				content: net].
	(alex isReserved: #constructor) 
		ifTrue: 
			[self expectedReserved: #constructor
			"			mess := self message.
			net := self net.
			^PNcCNet new net: net ; message: mess
"].
	(alex isReserved: #sync) 
		ifTrue: 
			[| tri |
			self expectedReserved: #sync.
			mess := self message.
			tri := Dictionary new.
			tri at: #cond put: (self optbas: #cond).
			tri at: #precond put: (self optbas: #precond).
			tri at: #guard put: self optGuard.
			tri at: #action put: self optAction.
			tri at: #postcond put: (self optbas: #postcond).
			^(PNCompiledPort new)
				name: (mess at: #selector);
				parameters: (mess at: #args);
				conds: (tri at: #cond);
				preconds: (tri at: #precond);
				postconds: (tri at: #postcond);
				guards: (tri at: #guard);
				actions: (tri at: #action);
				yourself

			"			^PNcSync new message: mess; cont: tri; sourceCode: ('sync ', (lexer textFromStopPosition)).
		^PNcSync new message: mess ; cont: tri"].
	
	(alex isReserved: #inhibitor) 
		ifTrue: 
			[| tri |
			self expectedReserved: #inhibitor.
			mess := self message.
			tri := Dictionary new.
			tri at: #cond put: (self optbas: #cond).
			tri at: #precond put: (self optbas: #precond).
			tri at: #guard put: self optGuard.
			tri at: #action put: self optAction.
			tri at: #postcond put: (self optbas: #postcond).
			^(PNCompiledNegativePort new)
				name: (mess at: #selector);
				parameters: (mess at: #args);
				conds: (tri at: #cond);
				preconds: (tri at: #precond);
				postconds: (tri at: #postcond);
				guards: (tri at: #guard);
				actions: (tri at: #action);
				yourself
		].
	
	self error