drawing
drawRelationForArc: anArc transition: aTrans 
	"draws the class aCDClass"

	| rel placeList place morph |

	rel := PNPTRelation new.
	rel netUI: self.
	placeList := model places select: [:each | each name = anArc place].
	place := placeList notEmpty
		ifTrue: [ placeList at: 1]
		ifFalse: [ self addPlaceFromObjectNetForArc: anArc ].
	rel arc: anArc.
	rel place: place transition: aTrans.
"	rel from: aTrans to: place."
	
	morph := self morphForRelation: rel.
	self addMorph: morph.
