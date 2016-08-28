as yet unclassified
pathName
  
	self parent isNil ifTrue: [ ^ '' ] ifFalse: [^ self parent pathName,'/', self name ].