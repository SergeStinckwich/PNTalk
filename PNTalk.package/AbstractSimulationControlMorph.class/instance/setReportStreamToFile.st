as yet unclassified
setReportStreamToFile
	| fileStream |
	fileStream:=(StandardFileMenu newFileStreamFrom: FileDirectory default ).
	fileStream ifNotNil: [self setReportStream: fileStream].