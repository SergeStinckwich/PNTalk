processing
processMessage: selector withArguments: args receiver: receiver

	| message |
	"zajistit, aby byla mozna pouze jedna varianta (ta 2. se zda byt univerzalnejsi)"
	(receiver isKindOf: PNCompiledClass)
		ifTrue: [ (selector = #new) ifTrue: [ ^ receiver newIn: self object parent ] ].
	"The receiver is a primitive Smalltalk object."
	(receiver isKindOf: PNtalkProxy)
		ifTrue: [ 
			(receiver reify isKindOf: PNCompiledClass)
				ifTrue: [ (selector = #new) ifTrue: [ ^ receiver reify newIn: self object parent ] ].
			(receiver reify = self object) 
				ifTrue: [ "UDELAT INTELIGENTNEJI ..."
					(selector = #halt) ifTrue: [ | o n t str |
						o := self object.
						t := self parent.
						n := t parent.
						o parent activity: false. 
						
						str := 'Simulation break at ', o yourClass name, '(', o id asString, ') : ',
							n yourNet name, '(', n id asString, ') : ',
							t yourName, '(', self id asString, ')'.
						"DialogWindow new alert: str title: 'PNtalk: Halt'."
						PNBrowser on: (o parent parent) title: str.
						^ receiver ].
				].
		]
		ifFalse: [ ^ receiver perform: selector withArguments: (args asArray) ].

	message := PNtalkMessage new selector: selector withArguments: (args asArray); 
		sender: (self object); receiver: receiver.
	self object thread: self willContinueAfter: message.
	^ receiver performDomainMessage: message.
