as yet unclassified
setStopTime

	| str |
	str := UIManager default request: 'new stoptime' initialAnswer: (model stopTime asString).
	str = '' ifFalse: [ 
		model asyncStopTime: ([str asNumber] on: Error do: [Float infinity]).
		self changed: #stopTimeWording ].
  