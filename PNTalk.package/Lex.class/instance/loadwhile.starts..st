lexing
loadwhile: block starts: b

| s c |

s := b asSymbol asString.
c := self lchar.
c isNil ifTrue: [^s].

[block value: c] whileTrue: [
	s := s, (c asSymbol asString).
	c := (self lchar).
	c isNil ifTrue: [^s].
].

self back: c.

^s