domain processing
chooseEvent
	
	| events sortedEvents |
	events := OrderedCollection new.
	self componentsDo: [ :item | events := events, item yourEvents ].
events isEmpty ifTrue: [ "self halt." ^ nil ].
	sortedEvents := events sort: [:a :b | (b name) >= (a name) ].
	^ sortedEvents removeFirst.
"
	index := (random next * (events size)) truncated +1.
	^events at: index.
"
"	events := (master componentsCollect: [:process | process yourEvents ])."