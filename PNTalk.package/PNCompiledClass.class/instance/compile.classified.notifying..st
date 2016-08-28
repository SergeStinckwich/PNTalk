browser
compile: aString classified: aCategoryName notifying: aController

	""
	| element |
self halt.
	element := PNParser new compile: aString.
	self addCompiledNet: element.