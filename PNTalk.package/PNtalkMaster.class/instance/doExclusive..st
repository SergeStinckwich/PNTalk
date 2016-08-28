domain processing
doExclusive: aBlock

	^ self doExclusive: aBlock ifFail: [ self error ].
	"only for testing!!!!"
"	^ aBlock value."
