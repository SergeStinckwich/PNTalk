as yet unclassified
addDelegate: anObject withName: aString

	"This method is the exact copy of TraitList>>addDelegate:withName:."
	"TODO: merge methods into common place, maybe PrototypeObjectWithSources?"

	| aName |

	(self delegateNames includes: (aString asSymbol)) ifFalse:
	[
		self addDelegate: (aString asAlphaNum) withValue: anObject.
	]
	ifTrue:
	[
		aName:=UIManager default request: 'new name?' initialAnswer: aString.
		((aName~='') & (aName notNil)) ifTrue:
		[
			self addDelegate: anObject withName: aName.
		]
	].