accessing
collectVariable: aName

	^ variables collect: [:item |
		item at: aName.
	].
