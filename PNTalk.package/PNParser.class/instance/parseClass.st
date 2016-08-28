parsing
parseClass

| ch1 ch2 rec nets |

(alex isReserved: #class) ifFalse: [ ^nil ].
self expectedReserved: #class.

ch1 := self id.
	"self expectedReserved: #is_a."
self expectedReserved: ('is_a' asSymbol).
ch2 := self id.

nets := self parseNets.
"
onet := self objectnet.
otherNet := self otherNet.
"

"
rec := Dictionary new.
rec at: #id1 put: ch1.
rec at: #id2 put: ch2.
rec at: #object put: onet.
rec at: #others put: otherNet.
"
^ PNCompiledClass new name: ch1; superClassName: ch2; compiledNets: nets; yourself.
"
^PNcClass new cont: rec.
"