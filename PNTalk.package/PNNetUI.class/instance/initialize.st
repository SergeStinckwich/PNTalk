initialize-release
initialize
	"initializes this instance"

	super initialize.
	transMorphs := OrderedCollection new.
	arcMorphs := OrderedCollection new.
	placeMorphs := OrderedCollection new.
	r := Random new.

	self extent: 3000 @ 3000.
	self color: Color transparent.
 	self borderWidth: 0.
"	self checking: false."