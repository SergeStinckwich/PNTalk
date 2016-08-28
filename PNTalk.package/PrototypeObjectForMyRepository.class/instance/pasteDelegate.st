as yet unclassified
pasteDelegate

	"This method is the exact copy of TraitList>>pasteDelegate."
	"TODO: merge methods into common place, maybe PrototypeObjectWithSources?"

	| obj |

	"NOTE: it gets a reference on the trait!!!"
	obj:=MyRepository getClipboardObject.
	(obj isKindOf: PrototypeObjectForMyRepository) ifTrue:
	[
		self addDelegate: obj withName: (obj name asString).
	]
	ifFalse:
	[
		self inform: 'The object on the clipboard cannot be used as a delegate.'.
	].