instance creation
newIn: aTransition
	| th |
	th := super new.
	aTransition addComponent: th.
	^ th.