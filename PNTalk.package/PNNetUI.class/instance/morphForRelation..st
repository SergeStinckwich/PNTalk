accessing
morphForRelation: aRelation
	"finds the morph representing aCDClass, creates it if needed"
	| relMorph |
	^ arcMorphs
		detect: [:each | each shownRelation = aRelation ]
		ifNone: [ | mClass |
			mClass := self morphClassForRelation: aRelation.
"			relMorph := mClass new initializeNetUI: self relation: aRelation."
			relMorph := mClass on: aRelation.
			arcMorphs add: relMorph.
			relMorph
		].