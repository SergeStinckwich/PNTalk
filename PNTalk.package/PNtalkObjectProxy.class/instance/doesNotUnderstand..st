prototypes
doesNotUnderstand: aMessage 
	"The default behavior is to create a Notifier containing the 
	appropriate message and to allow the user to open a Debugger. 
	Subclasses can override this message in order to modify this behavior."

	| sel args |
	args := aMessage arguments.
	sel := aMessage selector.

	^ self performMessage: (PNtalkMessage new selector: sel withArguments: args sender: self).
