parsing
smId

| n |
(alex isId) ifTrue: [
n := lexer lex.

(n isChar: $: ) ifTrue: [ lexer lexback: n. ^nil ] ifFalse: [ lexer lexback: n. ^self id ].
].

^nil