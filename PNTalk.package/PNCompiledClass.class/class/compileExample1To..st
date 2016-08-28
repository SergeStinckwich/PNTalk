examples
compileExample1To: aRepository
	"The basic example for testing transitions"

| cls |
cls := PNCompiledClass compileClass: 'main X

class Example1 is_a PN
object
        place start(#e)
        place size(0)
        trans inc
                precond start(#e), size(size)
                action {
                        newSize := size + 1.
                        }
                postcond start(#e), size(newSize)
method zero
        place return()
        trans zero
                precond size(size)
                postcond size(0), return(0)
'.
aRepository addComponent: cls named: (cls name).
^ cls.