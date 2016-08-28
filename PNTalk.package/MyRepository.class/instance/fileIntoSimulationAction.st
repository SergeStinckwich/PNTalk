menu actions
fileIntoSimulationAction

	| stdFileMenuResult obj aSymbol filename objname |

	stdFileMenuResult := ((StandardFileMenu new) pattern: '*';	"*.storestring ?" 
		oldFileFrom: FileDirectory default ) 
			startUpWithCaption: 'Select a File:' translated.
	stdFileMenuResult ifNil: [^ nil].

	filename := (stdFileMenuResult directory) fullNameFor: (stdFileMenuResult name). 

	obj := Object readFrom: (FileStream readOnlyFileNamed: filename) contentsOfEntireFile.
	obj ifNotNil: 
	[
		(obj isKindOf: CoupledDEVS) ifTrue:
		[
			objname := obj name isNil ifTrue: [ stdFileMenuResult name ] ifFalse: [ obj name ].
			aSymbol := self assureComponentName: objname.
			aSymbol ifNotNil:
			[
				obj name: aSymbol.
				self addComponents: {aSymbol -> (obj getSimulatorRT deepVerbose: false; reportStream: (DummyStream on: nil); yourself)}.
			].
		]
		ifFalse:
		[
			self error: 'Inappropriate object. Must be CoupledDEVS!'.
		].
	].
