as yet unclassified
simulationNamed: aName

	| repository |

	repository := MyRepository componentNamed: 'PNtalk simulations'.
	repository isNil ifFalse: [
		^ repository componentNamed: aName.
	].
	^ nil.
