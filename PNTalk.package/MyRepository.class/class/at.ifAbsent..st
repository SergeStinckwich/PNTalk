as yet unclassified
at: p ifAbsent: aBlock 

	| o |
	o := self at: p.
	^ o ifNil: [ aBlock value ] ifNotNil: [ o ]

