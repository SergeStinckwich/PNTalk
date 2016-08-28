copying
copyWith: aTranslator

	| c |
	c := self class new.
"	cal do: [:each | c calendar addLast: (each copyWith: aTranslator)]."
	cal do: [:each || rec |
		rec := each copy.
		rec at: 2 put: ((each at: 2) collect: [:e | e copyWith: aTranslator]).
		c calendar addLast: rec.
	].
	^ c.