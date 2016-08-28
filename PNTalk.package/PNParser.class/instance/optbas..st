parsing transition
optbas: res

| list |

(alex isReserved: res) 
	ifTrue: [
		self expectedReserved: res.
		list := self listofplus: [self idArcexpr ].
		^ list.
"		^PNcCond new type: res ; doubles: list"
	].

^nil