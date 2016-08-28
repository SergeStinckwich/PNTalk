processing
test: listVar
	"Testing one expression of guard."

	| result transition |
	collection notEmpty ifTrue: [ ^ self processResults. ].

	transition := parent.

"	result := expression value: listVar value: (self object) value: transition."
	listV := listVar.
	this := self object.
	context := transition.
	result := expression value.
	listV := this := context := nil.


	(result isKindOf: Boolean)
		ifTrue: [
			isBoolean := true.
			^ result.
"
			return put: listVar.			
			return put: nil.
			return set: result.
"
		]
		ifFalse: [
			collection := result.
			collection addLast: nil.
			^ self processResults.
"
			result success ifTrue: [
				bindings := result pop.
				allBindings := result pop.
				^ true.
			].
"
"			result success ifTrue: [ ^ result ]."
		].
	^ false.
"	^ return."