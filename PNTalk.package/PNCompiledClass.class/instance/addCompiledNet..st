compiler
addCompiledNet: aNet

	aNet parent: self.
	aNet isObjectNet ifTrue: [ objectNet := aNet.  ].
	aNet isPort ifTrue: [ portsList at: (aNet name) put: aNet ].
	aNet isMethod ifTrue: [ 
		(netsList keys includes: aNet name) ifTrue: [
			"tahle strasna prasarna je zde kvuli otevrenym editorum nad existujici siti"
			(netsList at: aNet name) become: aNet ] 
		ifFalse: [ netsList at: (aNet name) put: aNet ].
		(netsList at: aNet name) changed: #sourceCode ].
	self changed: #sourceCode.
	(MyRepository root) changed: #hierarchicalList.
