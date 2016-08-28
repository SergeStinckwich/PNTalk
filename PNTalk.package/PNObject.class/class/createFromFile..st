state
createFromFile: aName

	| stream clsName cls obj state translator |
self halt.
	stream := SixxReadStream readOnlyFileNamed: aName.
	state := stream contents at: 1.
	stream close.
	
	clsName := state removeFirst.
	cls := MyRepository objectWithPathName: ('/PNtalk classes/', clsName).
	obj := cls new.
	
	translator := PNOIDTranslator new.
"	state addFirst: translator."
	
	obj reify loadState: state translator: translator.
	^ obj.