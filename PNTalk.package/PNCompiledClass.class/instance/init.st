initialization
init
	super init.
	netsList := Dictionary new.
	portsList := Dictionary new.
	objectNet := PNCompiledObjectNet new.

	self superClassName: 'PN'.