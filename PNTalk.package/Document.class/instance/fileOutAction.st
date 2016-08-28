as yet unclassified
fileOutAction

	| fileStream |

	fileStream := (StandardFileMenu newFileStreamFrom: FileDirectory default ).
	fileStream ifNil: [^ nil].

	fileStream store: self.
	fileStream close.