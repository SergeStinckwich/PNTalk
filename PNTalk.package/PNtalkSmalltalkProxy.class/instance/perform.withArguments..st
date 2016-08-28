processing
perform: selector withArguments: args
	"If the inner object is primitive so the operation can be performed directly."
	^ inner perform: selector withArguments: args.
