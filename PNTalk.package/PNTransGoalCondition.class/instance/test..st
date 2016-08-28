processing
test: listVar
	"Testing one expression of guard."

	| mult variable result listV |
	mult := expression value.
	variable := expression key.
"
	mult := expression mult.
	variable := expression expression.
"
	listV := listVar copy.

	(variable name notNil and: [listV includesKey: (variable name)])
		ifTrue: [ variable := PNVariable value: (listV at: (variable name)) ].
	(mult name notNil and: [listV includesKey: (mult name)])
		ifTrue: [ mult := PNVariable value: (listV at: (mult name)) ].

	variable isList 
		ifTrue: [ variable := variable confrontWithVariables: listVar ].

"	result := place testMult: multVal expr: varVal from: TID arc: AID."

"	result := place test: (variable -> mult) from: self."
	result := place test: (variable -> mult) fromGoal: self.
	(result success)
		ifTrue: [ | resultItem | 
"			result pop associationsDo: [ :item | listV at: (item key) put: (item value).]."
" TADYK TO NENI DOBRE - REFAKT! "
"udelat to tak, ze bud nic (navazuje se konstanta), nebo se vzdy vrati list ..."
			result isEmpty 
				ifFalse: [
					resultItem := result pop.
					(resultItem isKindOf: PNtalkDictionary) 
						ifTrue: [ resultItem associationsDo: [ :item | listV at: (item key) put: (item value) ] ]
"						ifFalse: [ resultItem hasName ifTrue: [ listV at: (resultItem name) put: (resultItem value) ]."
						ifFalse: [ listV at: (resultItem name) put: (resultItem value) ].
				].
		].
	
	bindings := listV.
	

	
	^ result success.
"
	result put: listV.
	^ result.
"