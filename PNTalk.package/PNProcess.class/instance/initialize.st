initialize-release
initialize
	super initialize.
	threads := Dictionary new.
	events := OrderedCollection new.
	testevents := OrderedCollection new.
	transitions := Dictionary new.
	places := Dictionary new.
	state := #running.
