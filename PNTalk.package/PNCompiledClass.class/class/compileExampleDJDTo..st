examples
compileExampleDJDTo: aRepository
	"The example -- workflow of the Dutch Justice Department -- was originally developed by Rudiger Valk and W.M.P. van der Aalst."

| cls |
cls := PNCompiledClass compileClass: 'main X
class Case is_a PN
object
        place start(#e)
	  place p2()
	  place p31()
	  place p32()
	  place p41()
	  place p42()
	  place p5()
	  place p6()
	  place p71()
	  place p72()
	  place p73()
	  place stop()
        sync record
                precond start(#e)
                postcond p2(#e)
        sync print
                precond p2(#e)
                postcond p31(#e), p32(#e)
        sync verify
                precond p31(#e)
                postcond p41(#e)
        sync complete
                precond p32(#e)
                postcond p42(#e)
        sync collect
                precond p41(#e), p42(#e)
                postcond p5(#e)
        sync examine
                precond p5(#e)
                postcond p6(#e)
        sync dec1
                precond p6(#e)
                postcond p71(#e)
        sync dec2
                precond p6(#e)
                postcond p72(#e)
        sync dec3
                precond p6(#e)
                postcond p73(#e)
        sync charge
                precond p71(#e)
                postcond stop(#e)
        sync summon
                precond p72(#e)
                postcond stop(#e)
        sync suspend
                precond p73(#e)
                postcond stop(#e)
'.
aRepository addComponent: cls named: (cls name).

cls := PNCompiledClass compileClass: 'main X
class Structure is_a PN
object
	place start(#e)
	place p1()
	place p2()
	place p3()
	place p4()
	place p5()
	place p6()
	place p7()
	place p8()
	trans newCase
		precond start(#e)
		action { c := Case new }
		postcond p1(c)		
	trans official1a
		precond p1(c)
		guard { c record }
		postcond p2(c)
	trans official1b
		precond p1(c)
		guard { c examine }
		postcond p2(c)

	trans printer
		precond p2(c)
		guard { c print }
		postcond p5(c), p6(c)
	trans secretary
		precond p5(c)
		guard { c verify }
		postcond p7(c)
	trans official2
		precond p6(c)
		guard { c complete }
		postcond p8(c)
	trans putTogether
		precond p7(c), p8(c)
		guard { c collect }
		postcond p1(c)

	trans prosecutor1a
		precond p2(c)
		guard { c dec1 }
		postcond p3(c)
	trans prosecutor1b
		precond p2(c)
		guard { c dec2 }
		postcond p3(c)
	trans prosecutor1c
		precond p2(c)
		guard { c dec3 }
		postcond p3(c)

	trans tribunal1a
		precond p3(c)
		guard { c charge }
		postcond p4(c)
	trans tribunal1b
		precond p3(c)
		guard { c summon }
		postcond p4(c)
	trans official3
		precond p3(c)
		guard { c suspend }
		postcond p4(c)
'.

aRepository addComponent: cls named: (cls name).