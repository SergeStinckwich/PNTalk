examples
compileExample2
	"The basic example for testing transitions"

PNCompiledClass compileSource: 'main X

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