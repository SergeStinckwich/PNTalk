initialize-release
initialize
	super initialize.
	components := Dictionary new.
	idGen := PNtalkIDGenerator new.