state
storeState

	| processes store st dep inv messages |
	"bude treba vyresit ukladani zprav!!!!!!"
self halt.	
	"(class name, id, processes, calendar, dependencies, invocated)"
	st := OrderedCollection new.
	st addLast: self yourClass name.
	st addLast: self id.
	processes := components collect: [ :proc | proc storeState ].
	st addLast: processes.

	"dependencies: message->thread --- informace o tom, ktere vlakno zaslalo danou zpravu"
	dep := OrderedCollection new.
	st addLast: dep.
	listDependencies associationsDo: [:pair |
		dep addLast: (OrderedCollection new addLast: (pair key id); addLast: (pair value parent id);
						addLast: (pair value id); yourself).
	].

	"invocated methods: message->process --- informace o tom, ktery proces vznikl na zaklade prijate zpravy"
	inv := OrderedCollection new.
	st addLast: inv.
	listInvocatedMethods associationsDo: [:pair |
		inv addLast: (pair key id)->(pair value id).
	].

	"timto se ukladaji zpravy zaslane ... bude treba ukladat i zpravy prijate (invocatedMethods)?"
	messages := OrderedCollection new.
	st addLast: messages.
	listDependencies keysDo: [:msg |
		messages addLast: msg storeState.
	].

	store := SixxWriteStream new.
	store newFileNamed: 'pokus.six'.
	store nextPut: st.
	store close.
"
	^ st."