as yet unclassified
pathName
  parent isNil ifTrue: [^''] ifFalse: [^(parent pathName),'/',name].