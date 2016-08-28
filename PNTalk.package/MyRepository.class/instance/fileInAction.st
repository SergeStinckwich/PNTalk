menu actions
fileInAction

	| stdFileMenuResult obj aSymbol filename objname |

	stdFileMenuResult := ((StandardFileMenu new) pattern: '*';	"*.storestring ?" 
		oldFileFrom: FileDirectory default ) 
			startUpWithCaption: 'Select a File:' translated.
	stdFileMenuResult ifNil: [^ nil].

	filename := (stdFileMenuResult directory) fullNameFor: (stdFileMenuResult name). 

	obj := Object readFrom: (FileStream readOnlyFileNamed: filename) contentsOfEntireFile. "we use string here becouse reading from stream is bugy "
	obj ifNotNil: [
		objname := obj name isNil ifTrue: [ stdFileMenuResult name ] ifFalse: [ obj name ].
		aSymbol := self assureComponentName: objname.
		aSymbol ifNotNil: [ self addComponents: { aSymbol -> obj } ] ].
