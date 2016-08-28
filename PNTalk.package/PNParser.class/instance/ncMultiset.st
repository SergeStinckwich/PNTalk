multiset
ncMultiset

| n c d l2 |

l2 := lexer lex.

((#( #id #number) includes: (alex type)) & (l2 isChar: $` ))
	ifTrue: [
		n := self cMultiset.
"
		n := alex value.
		self lex.
"
	]
	ifFalse: [
		lexer lexback: l2.
	].

"!!!!!!!!!!!!!!!!!!
c := self cMultiset.
"
(alex isChar: $( ) ifTrue: [ c := self cMultisetList ]
ifFalse: [ c := self cMultiset ].
"!!!!!!!!!!!!!!!!!!!!"

"
d := Dictionary new.
d at: #n put: n.
d at: #c put: c.
"
n isNil ifTrue: [ n := 1 ].
d := c->n.
"d := PNMultiSet new add: c withOccurrences: n."
^d