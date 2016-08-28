parsing
listofplus: block

| sez n |

sez := OrderedCollection new.

n := block value.
(n isNil) ifTrue: [
	self parseError. ^nil
].
sez add: n.

[

	(alex isChar: $,) 
		ifTrue: [
			self expectedChar: $,.
			n := block value.
			sez add: n.
			true
		]
		ifFalse: [
			false
		]

] whileTrue: [].

^sez