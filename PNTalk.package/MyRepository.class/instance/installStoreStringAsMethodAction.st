menu actions
installStoreStringAsMethodAction

	| class message |


	(self confirm: 'DANGEROUS !!! Are you sure? Have you saved your image before?') ifFalse: [ ^nil ].

	self inform: 'a storeString will be installed as a method ... in a class ... '.

	"TO DO: dialog"
	class := #MyRepository.
	message := #aStoreString.

	(Smalltalk at: class) class compile: message asString, String cr, '^', self storeString printString.

