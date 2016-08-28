comparing
confrontWithVariables: aVariables

	| newList |

	newList := PNList new.
	^self confrontWithVariables: aVariables atIndex: 1 withResulting: newList.