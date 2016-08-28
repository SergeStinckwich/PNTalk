lexing
loadwhile: block

| s c|

self lchar isNil ifTrue: [^nil].
s := achar asSymbol asString.

[block value] whileTrue: [
	c := (self lchar).
	c isNil ifTrue: [^s].
	s := s, (c asSymbol asString).
].

self back: c.

^s