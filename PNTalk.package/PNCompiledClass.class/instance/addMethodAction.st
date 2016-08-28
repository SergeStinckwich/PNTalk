as yet unclassified
addMethodAction

	| str |
	str:=UIManager default request: 'New method name' initialAnswer: 'method'.
	"mohlo by tu byt zjisteni, zda dana metoda uz neexistuje"
	str~='' & str notNil ifTrue: [ self compileNet: str ].
