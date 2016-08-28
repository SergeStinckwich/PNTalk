examples
compileExample2To: aRepository
	"The basic example for testing transitions"

| cls |
cls := PNCompiledClass compileClass: 'main X

class Example2 is_a PN
object
        place start(#e)
        place goal(0)
        trans inc
                precond start(#e)
                action {
				col := FillInTheBlankMorph request: ''Neco zadej!''. }
                postcond goal(col)

'.

aRepository addComponent: cls named: (cls name).
^ cls.