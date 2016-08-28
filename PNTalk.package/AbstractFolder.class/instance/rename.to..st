as yet unclassified
rename: n1 to: n2

	| aComponent |
	(self componentNames includes: n1) ifFalse: [^false].
	(self componentNames  includes: n2) ifTrue: [^false].
	aComponent := self componentNamed: n1.
	self removeComponents: { n1 }.
	self addComponents: { n2 -> aComponent }.
	^true
