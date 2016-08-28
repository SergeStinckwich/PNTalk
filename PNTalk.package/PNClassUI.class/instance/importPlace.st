event handling
importPlace
	| name place |
	name := UIManager default request: 'imported place name'.
	place := model parent objectNet inheritedPlaces at: name.
	self drawImportedPlace: place