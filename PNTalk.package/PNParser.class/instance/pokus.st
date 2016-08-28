smalltalk post-parsing
pokus

	| stream ret src |
	self halt.
	src := ' #(10 20 30) at: n'.
	src := ' tmp := self add: (self neco + 10).  [ blok ] value.	'.
	src := ' { tmp := self add: (self neco + 10). } postcond p(a), p(b)'.
	stream := ReadStream on: src asString.
"	ret := self parse: stream class: self class noPattern: false context: nil notifying: nil ifFail: [ self error ]. "
	ret := self parseAction: stream ifFail: [ self error ]. 

	ret statements do: [:statement | self processStatement: statement ].