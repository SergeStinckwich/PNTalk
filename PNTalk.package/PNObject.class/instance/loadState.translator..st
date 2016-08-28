state
loadState: state translator: translator

	| processes messages objnet deps invs |
	
	"(class name, id, processes, calendar, dependencies, invocated, messages)"
"	translator := state removeFirst."
	translator world: self parent.
	
	id := state removeFirst.
	processes := state removeFirst.
	deps := state removeFirst.
	invs := state removeFirst.
	messages := state removeFirst.
	
	"!!!!! processes at: 1 je objektova sit, ta si zaslouzi specialni pristup"
	objnet := processes removeFirst.
	(self componentID: 1) loadState: objnet to: self translator: translator.
	
	processes do: [:stat || proc |
		"(name, id, places, threads)"
		proc := self yourClass findMethod: (stat at: 1).	
		proc := proc new.
		stat addFirst: translator.
		proc loadState: stat to: self translator: translator.
	].

	""
	messages do: [:d || msg |
		msg := translator messageWithOldID: (d at: 1).
		msg isNil ifTrue: [ 
			msg := PNtalkMessage new loadState: d translator: translator.
			translator putMessage: msg oldID: (d at: 1).
		]
	].
	
	"dependencies: message->thread --- informace o tom, ktere vlakno zaslalo danou zpravu"
	deps do: [:dep || msg |
		msg := translator messageWithOldID: (dep at: 1).
	].
"
	listDependencies associationsDo: [:pair |
		dep addLast: (OrderedCollection new addLast: (pair key id); addLast: (pair value parent id);
						addLast: (pair value id); yourself).
	].
"

	"invocated methods: message->process --- informace o tom, ktery proces vznikl na zaklade prijate zpravy"
	invs do: [:inv || msg prc |
		msg := translator messageWithOldID: (inv at: 1).
		prc := self componentID: (inv at: 2).
		listInvocatedMethods at: msg put: prc.
	].
"
	listInvocatedMethods associationsDo: [:pair |
		inv addLast: (pair key id)->(pair value id).
	].
"
