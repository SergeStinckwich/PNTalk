as yet unclassified
sourceCode
"	^ objectNet sourceCode."

	| src |
	src := 'class ', self name, ' is_a ', self superClassName, String cr.
	src := src, objectNet sourceCode.
	portsList do: [:port | src := src, port sourceCode ].
	^ src.
		