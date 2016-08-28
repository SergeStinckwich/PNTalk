state
loadState: stat to: anObject translator: translator

	| pls ths |
	self id: (stat at: 2).
	anObject addComponent: self.
	pls := stat at: 3.
	pls do: [:pl |
		(self placeNamed: (pl at: 1)) loadState: pl translator: translator.
	].
	ths := stat at: 4.
	ths do: [:th || t |
		t := PNtalkThread new.
		t loadState: th to: self translator: translator.
	].