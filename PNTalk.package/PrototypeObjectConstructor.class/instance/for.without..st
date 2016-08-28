as yet unclassified
for: aPrototypeObject without: excludedSlots

	class := aPrototypeObject species.
	slots := Dictionary new.
	(aPrototypeObject slotNames) do: [ :n | 
		(excludedSlots includes: n)
			ifTrue:  [ slots at: n put: nil ] 
			ifFalse: [ slots at: n put: (TemporarySymlink 
				toObject: (aPrototypeObject perform: n asSymbol) owner: self)] ].
	delegates := Dictionary new.
	(aPrototypeObject delegateNames) do: [ :n | 
		delegates at: n put: (TemporarySymlink 
			toObject: (aPrototypeObject perform: n asSymbol) owner: self) ].
	methods := Dictionary new.
	(aPrototypeObject methodNames difference: #(DoIt), excludedSlots) do: [ :n | 
		methods at: n put: (aPrototypeObject methodSourceAt: n asSymbol) ].