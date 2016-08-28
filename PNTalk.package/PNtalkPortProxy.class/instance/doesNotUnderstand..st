prototypes
doesNotUnderstand: aMessage 
	"The default behavior is to create a Notifier containing the 
	appropriate message and to allow the user to open a Debugger. 
	Subclasses can override this message in order to modify this behavior."

	| sel args res return msg |
	args := aMessage arguments.
	sel := aMessage selector.

	msg := PNtalkMessage new selector: sel withArguments: args.
	res := self testPort: msg.
	return := PNtalkBoundPortProxy new inner: inner.
	return message: msg.
	res do: [:item |
		return add: (item get variables -> item get bindings).	
	].
	^ return.
	
