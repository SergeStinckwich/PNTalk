processing
yourEvents
"	^events."

	| events |
	events := OrderedCollection new.
	bindings do: [:item || event |
		event := PNtalkEvent new.
		event event: self.
"		event bindings: (item at: 1)."
		event bindings: item.
		events add: event.
	].
	^events.