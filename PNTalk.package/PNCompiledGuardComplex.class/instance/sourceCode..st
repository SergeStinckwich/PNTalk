as yet unclassified
sourceCode: queue
	
	| src |
	src := ''.
	actions do: [ :item | src := src, (item sourceCode: queue) ].
	^ src.