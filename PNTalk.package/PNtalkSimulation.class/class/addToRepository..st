as yet unclassified
addToRepository: aSim

	| repository |

	repository := MyRepository componentNamed: 'PNtalk simulations'.
	repository isNil ifTrue: [
		repository := MyRepository new.
		repository name: 'PNtalk simulations'.
		MyRepository root addComponent: repository named: (repository name).
	].

	repository addComponent: aSim named: (aSim name).

	^ aSim.
