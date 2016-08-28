examples
compileAckermannTo: aRepository

"PNCompiledClass compileSource: '"
| cls |
cls := PNCompiledClass compileClass: '
main Ackermann
class Ackermann is_a PN
object
method x: x y: y
	place x()
	place y()
	place return()
	trans one
		precond x(x), y(y)
		guard { x = 0 }
		action { z := y + 1 }
		postcond return(z)
	trans two
		precond x(x), y(y)
		guard { x > 0. y = 0 }
		action { 
			x2 := x - 1.
			z := self x: x2 y: 1. 
		}
		postcond return(z)
	trans three
		precond x(x), y(y)
		guard { x > 0. y > 0 }
		action { 
			x2 := x - 1.
			y2 := y - 1.
			inner := self x: x y: y2.
			z := self x: x2 y: inner.
		}
		postcond return(z)
'.

aRepository addComponent: cls named: (cls name).