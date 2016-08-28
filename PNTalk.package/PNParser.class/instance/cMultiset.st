multiset
cMultiset

(alex type = #id) 
	ifTrue: [
"		^self id"
		^ PNVariable new name: (self id).
	]
	ifFalse: [
		^ self literal
"		^PNVariable new value: (self literal)."
	]