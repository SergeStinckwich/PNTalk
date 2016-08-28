copying
copy
	| aCopy |

	aCopy:=(self class) new.
	self keysAndValuesDo: [:k :v | aCopy at: k put: (v copy).].
	^aCopy