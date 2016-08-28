copying
postCopy: aCalendar translator: aTranslator

	cal do: [:each | aCalendar addLast: (each copyWith: aTranslator)].