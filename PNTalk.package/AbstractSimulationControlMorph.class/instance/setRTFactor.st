as yet unclassified
setRTFactor

  | str |
  str := UIManager default request: 'new RT factor' initialAnswer: (model rtFactor asString).
  str= '' ifFalse: [
  	model asyncRtFactor: (str asNumber asFloat).
	self changed: #rtFactorWording ].
  