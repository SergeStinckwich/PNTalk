copying
postCopyWith: aTranslator	
	
	| l |
	l := components.
	components := Dictionary new.
"	l valuesDo: [:proc | self addComponent: (proc copyWith: aTranslator). ]."
	
	"!!!!!! tadyk zaciname od 1, aby byl nejprve object net. Lepsi reseni by bylo
	udelat kopirovani univerzalnejsi (prvne obalka, pak vnitrky"
"	l valuesDo: [:proc | self addComponent: (proc copyWith: aTranslator parent: self). ]."
	l keysSortedSafely do: [:k || proc | proc := l at: k. self addComponent: (proc copyWith: aTranslator parent: self). ].
