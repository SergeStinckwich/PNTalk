as yet unclassified
setReportStream: aStream
	aStream ifNotNil: [
		model asyncReportStream: aStream.
		self changed: #logWording ].