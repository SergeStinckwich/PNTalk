parsing net
parsePlace

| id init imark |

(#(#place #inputPlace #outputPlace) includes: (alex value)) 
	ifFalse: [
		 ^nil
	].


(alex isReserved: #place) 
	ifTrue: [
		self expectedReserved: #place.
		id := self id.
		self expectedChar: $(.
		(alex isChar: $)) ifFalse: [ imark := self multiset ].
		self expectedChar: $).
"		(alex isChar: $( ) ifTrue: [ init := self placeInit ]."
		init := self placeInit.
		^ PNCompiledPlace new name: id; iMark: imark; initActions: init.
"		^PNcPlace new id: id ; imark: imark ; init: init"
	].

(alex isReserved: #inputPlace) 
	ifTrue: [
		self expectedReserved: #inputPlace.
		id := self id.
		self expectedChar: $(.
		(alex isChar: $)) ifFalse: [ imark := self multiset ].
		self expectedChar: $).
"		(alex isChar: $( ) ifTrue: [ init := self placeInit ]."
		init := self placeInit.
		^ PNCompiledAsyncPort new asInput name: id; iMark: imark; initActions: init.
"		^PNcPlace new id: id ; imark: imark ; init: init"
	].
(alex isReserved: #outputPlace) 
	ifTrue: [
		self expectedReserved: #outputPlace.
		id := self id.
		self expectedChar: $(.
		(alex isChar: $)) ifFalse: [ imark := self multiset ].
		self expectedChar: $).
"		(alex isChar: $( ) ifTrue: [ init := self placeInit ]."
		init := self placeInit.
		^ PNCompiledAsyncPort new asOutput name: id; iMark: imark; initActions: init.
"		^PNcPlace new id: id ; imark: imark ; init: init"
	].

