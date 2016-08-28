parsing
literal

| o |
"
(alex type = #spec)
	ifTrue: [
		o := alex value.
		self expectedType: #spec.
		^ o.		
	].
"

(alex type = #number) 
	ifTrue: [ 
		o := alex value.
		self expectedType: #number.
		^o
	].

(alex type = #float) 
	ifTrue: [ 
		o := alex value.
		self expectedType: #float.
		^o
	].

(alex isChar: $$) 
	ifTrue: [
		self expectedChar: $$.
		o := alex value.
		self expectedType: #char.
		^o
	].

(alex isChar: $#) 
	ifTrue: [
		self expectedChar: $#.
		o := (alex value) asSymbol.
		self expectedType: #id.
		^o
	].

self parseError.
^nil