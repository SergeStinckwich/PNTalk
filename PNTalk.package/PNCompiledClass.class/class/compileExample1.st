examples
compileExample1
	"The basic example for testing transitions"

PNCompiledClass compileSource: 'main X

class Example1 is_a PN
object
        place start()
        place size(0)
        trans inc
                precond start(#e), size(size)
                action {
                        newSize := size + 1.
                        self hold: 1. }
                postcond start(#e), size(newSize)
method goFor: aTime
        place aTime()
        place p1()
        place p2()
        place return()
        trans go
                precond aTime(time)
                postcond start(#e), p1(time)
        trans wait
                precond p1(time)
                action { self hold: time }
                postcond p2(#e)
        trans finish
                cond size(size)
                precond p2(#e), start(#e)
                postcond return(size)
method zero
        place return()
        trans zero
                precond size(size)
                postcond size(0), return(0)
'.