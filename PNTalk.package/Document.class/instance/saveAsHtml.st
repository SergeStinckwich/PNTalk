as yet unclassified
saveAsHtml

	| fileStream |
	fileStream := (StandardFileMenu newFileStreamFrom: FileDirectory default ).
	fileStream ifNil: [^ nil].

	fileStream nextPutAll: self asHtml.
	fileStream close.
