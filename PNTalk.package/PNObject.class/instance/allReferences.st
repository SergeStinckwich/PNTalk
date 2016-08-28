garbage collector
allReferences

	| set |
	set := IdentitySet new.
	^ self allReferences: set.
