processing
fireFor: listVar bindings: aBind

	fireExpression isNil ifFalse: [
"		fireExpression value: listVar value: aBind value: self."
		listV := listVar.
		binds := aBind.
		context := self.
		fireExpression value.
		listV := binds := context := nil.
	].
"
	result := expression value: listVar value: (self master) value: self.
	^ result.
"