examples
compileExample0To: aRepository
	"The basic example for testing transitions"

| cls |
cls := PNCompiledClass compileClass: 'main X

class Example0 is_a PN
object
        place start(#e)
        place size(0)
        trans inc
                precond start(#e), size(size)
                action {
                        newSize := size + 1. }
                postcond size(newSize)
'.
aRepository addComponent: cls named: (cls name).
^ cls.
