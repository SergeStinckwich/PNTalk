deprecated
fire: listVar

	| result |
self deprecated.
	fireExpression isNil ifFalse: [
		fireExpression value: listVar value: (self object) value: self.
	].
"
	result := expression value: listVar value: (self master) value: self.
	^ result.
"