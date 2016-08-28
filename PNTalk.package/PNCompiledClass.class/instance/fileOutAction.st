as yet unclassified
fileOutAction

	| fileStream |

	fileStream := (StandardFileMenu newFileStreamFrom: FileDirectory default ).
	fileStream ifNil: [^ nil].

"	self storeOn: fileStream."
	fileStream store: self.
	fileStream close.
