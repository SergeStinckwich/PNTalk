private
deepProcess

	dP := true.
	deepProcess := [
		[ dP ] whileTrue: [ | t |
"			self primDeepCollect."
			t := Time millisecondClockValue + 5000.
			timer := Timer at: t.
			timer wait.
			simulation world deepCollect.
		].
	] forkAt: self class priority.