processing
test
	
	| trans |
	testevents := OrderedCollection new.
"	trans := transitions select: [ :item | item test ].
	trans do: [ :item | testevents := testevents, item yourEvents ]."
	trans := self testTransitions.
	trans isNil ifFalse: [ testevents := testevents, trans yourEvents ].
	^ (events notEmpty) | (testevents notEmpty).