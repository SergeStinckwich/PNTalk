examples
compileExampleBankModelTo: aRepository
	"The basic example for testing transitions"

| cls |
cls := PNCompiledClass compileClass: 'main X
class BankModel is_a PN
    object
        place FIFO()
        place period()
        trans enter
            precond p2( arrival ), capacity( #e )
            postcond FIFO( arrival )
        place p1(#e)
        place p2()
        trans update_stat
            precond nonename87( arrival ), stat1(oldCustOut), stat2(oldTotalTime)
            action {
			totalTime := oldTotalTime + self time - arrival.
			custOut := oldCustOut + 1.}
            postcond stat1(custOut), stat2(totalTime)
        place clerks()
        place stat1(0)
        place stat2(0)
        place capacity(100`#e)
        place nonename87()
        trans generator
            cond period( period )
            precond p1( #e )
            guard {period <= 3}
            action {
			self hold: ((Uniform from: (#(1 2 1) at: period) to: (#(4 9 3) at: period)) next).
			arrival := self time.}
            postcond p1( #e ), p2( arrival )
        trans service
            precond FIFO( arrival ), clerks( #e )
            action {
			self hold: ((Normal mean: 6 deviation: 1) next).}
            postcond capacity( #e ), clerks( #e ), nonename87( arrival )

    method makeExperimentForPeriod: p clerks: c
        place c()
        place p ()
        trans nonename95
            precond p ( p ), c( c )
            postcond p11( #e ), period( p ), clerks( c`#e )
        place return()
        place p11()
        trans experiment
            precond p11( #e )
            action {self hold: 100.}
            postcond nonename97( #e )
        place nonename97()
        trans nonename90
            precond nonename97( #e ), stat1(custOut), stat2(totalTime), period(p)
            action { avgTime := totalTime / custOut.}
            postcond return( avgTime )
'.

aRepository addComponent: cls named: (cls name).

"
class BankModel is_a PN
    object
        place FIFO()
        place period()
        trans enter
            precond p2( arrival ), capacity( #e )
            postcond FIFO( arrival )
        place p1(#e)
        place p2()
        trans update_stat
            precond nonename87( arrival ), stat( (oldCustOut, oldTotalTime) )
            action {
			totalTime := oldTotalTime + self time - arrival.
			custOut := oldCustOut + 1.}
            postcond stat( (custOut, totalTime) )
        place clerks()
        place stat((0, 0))
        place capacity(100`#e)
        place nonename87()
        trans generator
            cond period( period )
            precond p1( #e )
            guard {period <= 3}
            action {
			self hold: (Uniform min: (#(1 2 1) at: period) max: (#(4 9 3) at: period)).
			arrival := self time.}
            postcond p1( #e ), p2( arrival )
        trans service
            precond FIFO( arrival ), clerks( #e )
            action {
			self hold: (Normal mean: 6 deviation: 1).}
            postcond capacity( #e ), clerks( #e ), nonename87( arrival )

    method makeExperimentForPeriod: p clerks: c
        place c()
        place p ()
        trans nonename95
            precond p ( p ), c( c )
            postcond p11( #e ), period( p ), clerks( c`#e )
        place return()
        place p11()
        trans experiment
            precond p11( #e )
            action {self hold: 600.}
            postcond nonename97( #e )
        place nonename97()
        trans nonename90
            precond nonename97( #e ), stat( (custOut, totalTime) )
            action { avgTime := totalTime / custOut.}
            postcond return( avgTime )
"