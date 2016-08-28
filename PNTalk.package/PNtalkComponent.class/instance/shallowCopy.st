copying
shallowCopy

	| obj |
	obj := self class basicNew.
	obj id: id.
	obj name: name.
	^ obj.