menu actions
fileOutAction

	| fileStream |

	(self confirm: 'DANGEROUS !!! Are you sure? Have you saved your image before?') ifFalse: [ ^nil ].

	fileStream := (StandardFileMenu newFileStreamFrom: FileDirectory default ).
	fileStream ifNil: [^ nil].

	fileStream store: self.
	fileStream close.
