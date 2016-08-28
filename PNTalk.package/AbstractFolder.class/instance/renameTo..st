as yet unclassified
renameTo: str
	"Return true if this is OK."

	| n | 
	n := self parent assureComponentName: str.
	n ifNotNil: [ self parent rename: self name to: str asSymbol ].
	^ n notNil  
