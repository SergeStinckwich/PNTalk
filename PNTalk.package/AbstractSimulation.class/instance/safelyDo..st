private
safelyDo: aBlock

	| r v |
	accessProtect critical: [
		r := self stopUnprotected.
		v := aBlock value.
		r ifTrue: [ self startUnprotected ] ].
	^ v
