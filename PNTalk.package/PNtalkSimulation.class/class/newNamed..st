as yet unclassified
newNamed: aName

	| repository simulation |

	repository := MyRepository componentNamed: 'PNtalk simulations'.
	repository isNil ifTrue: [
		repository := MyRepository new.
		repository name: 'PNtalk simulations'.
		MyRepository root addComponent: repository named: (repository name).
	].

	simulation := repository componentNamed: aName.
	simulation isNil ifTrue: [
"		simulation := self new."
		simulation := super new world: (PNtalkWorld name: aName).
		simulation name: aName.
		repository addComponent: simulation named: (simulation name).
	].
	
"	(MyRepository root) changed: #hierarchicalList."
	
	^ simulation.
