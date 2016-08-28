event handling
importPlace

	| name place places pl |

	name := UIManager default request: 'Imported place name' initialAnswer: ''.
	"str~='' & str notNil"

	places := model parent objectNet places.
	pl := places select: [:each | each name = name ].
	place := pl isEmpty
		ifTrue: [ model parent objectNet inheritedPlaces at: name ]
		ifFalse: [ pl at: 1 ].

	self drawImportedPlace: place.
