parsing net
netIn

| id init imark tri |

(#(#place #trans #inputPlace #outputPlace) includes: (alex value)) 
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

(alex isReserved: #trans)
	ifTrue: [
		self expectedReserved: #trans.
		id := self id.
		tri := Dictionary new.
		tri at: #cond put: (self optbas: #cond).
		tri at: #precond put: (self optbas: #precond).
		tri at: #guard put: (self optGuard).
		tri at: #action put: (self optAction).
		tri at: #postcond put: (self optbas: #postcond).
		^ PNCompiledTransition new name: id;
			conds: (tri at: #cond);
			preconds: (tri at: #precond);
			postconds: (tri at: #postcond);
			guards: (tri at: #guard);
			actions: (tri at: #action);
			yourself.
"		^PNcTrans new id: id ; cont: tri"
	].