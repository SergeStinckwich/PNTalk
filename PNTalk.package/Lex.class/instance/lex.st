lexing
lex

| poms |

lexback isNil ifFalse: [ 
	poms := lexback. lexback := nil.
	^poms
].

previousPosition := fnstream position.

self loadwhile: [ :ca | ca isSeparator ] starts: ' '.
self lchar.

(achar isNil ifTrue: [ ^LexerT new type: #eof ]).

(achar isLetter) ifTrue: [
	poms := self loadwhile: [ : ca | (ca isLetter) | (ca isDigit) | (ca=$_) ] starts: achar.
	^self checkId: poms.
].

(achar isDigit) ifTrue: [ | c poms2 |
	poms := self loadwhile: [ : ca | ca isDigit ] starts: achar.
	
	c := self lchar.
	(c = $.)
		ifTrue: [
			poms2 := self loadwhile: [ : ca | ca isDigit ] starts: c.
			^ LexerT new type: #float ; value: ((poms, poms2) asNumber)
		].

	self back: c.
	^LexerT new type: #number ; value: (poms asNumber)
].


^LexerT new type: #char ; value: achar