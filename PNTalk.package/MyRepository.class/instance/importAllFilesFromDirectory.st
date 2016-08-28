menu actions
importAllFilesFromDirectory

	| directory |
	directory := FileList2 modalFolderSelector.
	directory ifNil: [^self].
	self importFrom: directory
