accessing
morphClassForRelation: aRelation

	aRelation isCondition ifTrue: [ ^ PNCondMorph ].
	aRelation isPrecondition ifTrue: [ ^ PNPreCondMorph ].
	aRelation isPostcondition ifTrue: [ ^ PNPreCondMorph ].
