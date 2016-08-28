port processing
performBindedPort: aMsg

	| mContext |
	aMsg domain.
	mContext := self yourClass performPort: aMsg forObject: self.
	"pokud neexistuje, bylo presmerovano primo na objekt, takze nedelame nic"
	mContext isNil ifTrue: [ ^ false ].
	^ mContext performFor: (aMsg arguments).
