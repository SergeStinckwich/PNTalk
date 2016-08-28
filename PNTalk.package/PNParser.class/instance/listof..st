parsing
listof: block

| sez n |

sez := OrderedCollection new.

n := block value.
[ n isNil ] whileFalse: [
	sez add: n.
	n := block value.
].

^sez