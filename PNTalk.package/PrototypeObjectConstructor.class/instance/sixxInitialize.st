as yet unclassified
sixxInitialize
	"The method is called after the loading of the receiver"

	| s d m |
	s := slots. d := delegates. m := methods.
	self become: class new.
	s keysAndValuesDo: [ :k :v | self addSlot: k withValue: v ].
	d keysAndValuesDo: [ :k :v | self addDelegate: k withValue: v ].
	m keysAndValuesDo: [ :k :v | self addMethod: v ].

