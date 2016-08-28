comparing
confrontWithList: aSecondList dictionary: listVar

	| index |
	((self size) = (aSecondList size))
		ifFalse: [ ^false ].

	index := 1.

	^self confrontWithList: aSecondList atIndex: index variables: listVar.