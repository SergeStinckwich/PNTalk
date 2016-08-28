browser
actionSourceCode

	| src queue |
	src := ''.
	actionsList isEmpty ifFalse: [
		queue := OrderedCollection new.
		actionsList do: [ :action | src := src, (action sourceCode: queue)].
	].
	^ src.