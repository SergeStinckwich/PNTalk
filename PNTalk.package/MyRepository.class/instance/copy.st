copying
copy

	| aCopy var |
	
	"we must copy each instance variable, because of the successors of MyRepository"
	aCopy := (self class) new.
	"parent MUST BE NIL, will be set in addComponents:"
	aCopy name: name; parent: nil.
	"We don't trust in the copy method of Dictionary. Later we could use MyDictionary that copies every element."
	namedComponents keysAndValuesDo: [:k :v | aCopy addComponents: { k-> (v copy)}].
	"the remaining instance variables are copied with copy, hopefully"
	(self class allInstVarNames difference: {'parent'. 'namedComponents'. 'name'. }) do: 
	[:n |
		var := (self instVarNamed: n) copy.	
		aCopy instVarNamed: n put: var.
	].
	^  aCopy
