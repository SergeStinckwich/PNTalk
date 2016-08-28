drawing
drawArcsForTransition: aTrans 
	"draws the class aCDClass"

	aTrans conditions do: [:arc | self drawRelationForArc: arc transition: aTrans ].
	aTrans preConditions do: [:arc | self drawRelationForArc: arc transition: aTrans ].
	aTrans postConditions do: [:arc | self drawRelationForArc: arc transition: aTrans ].


"
	| morph rel place placeList |
	aTrans conditions do: 
			[:cond | 
			rel := PNPTRelation new.
""			place := (component places select: [:each | each name = cond place]) at: 1.""
			placeList := component places select: [:each | each name = cond place].
			place := placeList notEmpty
				ifTrue: [ placeList at: 1]
				ifFalse: [ self addPlaceFromObjectNetForArc: cond ].
			rel from: aTrans to: place.
			rel condition: cond.
			morph := self morphForCondition: rel.
			self addMorph: morph].
	aTrans preConditions do: 
			[:cond | 
			rel := PNPTRelation new.
			rel condition: cond.
			placeList := component places select: [:each | each name = cond place].
			place := placeList notEmpty
				ifTrue: [ placeList at: 1]
				ifFalse: [ self addPlaceFromObjectNetForArc: cond ].
			rel from: place to: aTrans.
			morph := self morphForPreCondition: rel.
			self addMorph: morph].
	aTrans postConditions do: 
			[:cond | 
			rel := PNPTRelation new.
			rel condition: cond.
""			place := (component places select: [:each | each name = cond place]) at: 1.""
			placeList := component places select: [:each | each name = cond place].
			place := placeList notEmpty
				ifTrue: [ placeList at: 1]
				ifFalse: [ self addPlaceFromObjectNetForArc: cond ].
			rel from: aTrans to: place.
			morph := self morphForPreCondition: rel.
			self addMorph: morph]
		"