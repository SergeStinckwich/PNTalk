browser
guardSourceCode

	| src queue |
	src := ''.
	guardsList isEmpty ifFalse: [
		queue := OrderedCollection new.
		guardsList do: [ :guard | src := src, (guard sourceCode: queue)].
	].
	^ src.