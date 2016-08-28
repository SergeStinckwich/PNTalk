event handling
positionFor: aMorph

	| index1 index2 pointA pointB a b delta block newPoint |
	
	(aMorph == model fromMorph)
		ifTrue: [ index1 := 1. index2 := self vertices size. ]
		ifFalse: [
			(aMorph == model toMorph)
				ifTrue: [ index1 := self vertices size. index2 := 1. ]
				ifFalse: [ ^ self ]
		].

	pointA := aMorph bounds center.
"	pointA := self vertices at: index1."
	pointB := self vertices at: index2.
	
	block := [:x :y :sign || myx myy | 
		myx := x.
		myy := a * myx + b.
		((myy - y) sign = sign)
			ifTrue: [ myy := y. myx := (myy - b) / (a+0.1)].
		myx@myy.
	].

	"y = ax + b"
	a := (pointB y - pointA y) / (pointB x - pointA x + 0.1).
	b := (pointA y) - (a * (pointA x)).

	delta := pointB - pointA.
	newPoint := (delta x > 0)
		ifTrue: [
			(delta y > 0) ifTrue: [ block value: (aMorph bounds right) value: (aMorph bounds bottom) value: (delta y sign) ]
			ifFalse: [ block value: (aMorph bounds right) value: (aMorph bounds top) value: (delta y sign) ].
		] ifFalse: [
			(delta y > 0) ifTrue: [ block value: (aMorph bounds left) value: (aMorph bounds bottom) value: (delta y sign) ]
			ifFalse: [ block value: (aMorph bounds left) value: (aMorph bounds top) value: (delta y sign) ].
		].	
	
	self verticesAt: index1 put: (aMorph bounds pointNearestTo: newPoint).
	valueMorph position: self bounds center.
