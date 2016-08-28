XXX instance creation
newIfNotExecutableDo: aBlock

	| obj |
	obj := self new.
	obj reify ifNotExecutableDo: aBlock.
	^ obj.
