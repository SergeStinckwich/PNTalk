parsing
classes

| f1 f2 f3 |

f1 := self listof: [ self parseClass ].		
self expectedReserved: #main.
f2 := self id.
f3 := self listof: [ self parseClass ].

^f1,f3