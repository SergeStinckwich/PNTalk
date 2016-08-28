menu actions
fileInFromMethodAction

	| class message obj aSymbol objname |

	"TO DO: dialog"
	class := #MyRepository.
	message := #aStoreString.

	obj := Object readFrom: ((Smalltalk at: class) perform: message). 
	obj ifNotNil: [
		objname := obj name isNil ifTrue: [ message asString ] ifFalse: [ obj name ].
		aSymbol := self assureComponentName: objname.
		aSymbol ifNotNil: [ self addComponents: { aSymbol -> obj } ] ].

