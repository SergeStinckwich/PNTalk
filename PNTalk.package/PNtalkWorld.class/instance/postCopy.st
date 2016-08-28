copying
postCopy

	| translator |
	translator := PNOIDTranslator new world: self.
	
	super postCopy.
	
	components valuesDo: [:obj | obj stop ].
	components valuesDo: [:obj | translator clearObject. obj postCopyWith: translator. ].
	components valuesDo: [:obj | obj start ].

	calendar := calendar copyWith: translator.