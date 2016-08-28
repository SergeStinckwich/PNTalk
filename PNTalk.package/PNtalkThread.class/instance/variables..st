initialization
variables: aVariables
	variables := aVariables.
"	variables at: #self put: (self object newProxy).	"
	"??? uz by tam snad mel byt -- je situace, kdy je toto nutne??"
	variables at: #self put: self object.
