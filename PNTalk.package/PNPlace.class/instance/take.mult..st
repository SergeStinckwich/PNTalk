accessing
take: anItem mult: aMult

	| mult newMult |
	(content includesKey: anItem)
		ifTrue: [ 
			mult := content at: anItem.
			newMult := mult - aMult.
			(newMult > 0)
				ifTrue: [ content at: anItem put: newMult. ^ newMult ].
			(newMult = 0)
				ifTrue: [ content removeKey: anItem. orderedContent remove: anItem. ^ 0 ]
				ifFalse: [ self error: 'PNPlace take> a number of removed objects is greater that it is stored' ].
		]
		ifFalse: [ self error: 'PNPlace take> removed object is not stored' ].