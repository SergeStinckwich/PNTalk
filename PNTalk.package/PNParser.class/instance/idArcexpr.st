parsing transition
idArcexpr

| id ae |

id := self id.
self expectedChar: $(.
ae := self arcexpr.
self expectedChar: $).

^OrderedCollection with: id with: ae