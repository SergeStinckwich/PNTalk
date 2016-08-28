compiling
compileModel: aString inSpace: aSpace
	""

	| elements |
	elements := PNParser new compileModel: aString.
	elements do: [:el | aSpace addComponent: el named: (el name) ].
