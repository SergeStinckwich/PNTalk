parsing net
parseTransition

| id tri |

(#(#trans) includes: (alex value)) 
	ifFalse: [
		 ^nil
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