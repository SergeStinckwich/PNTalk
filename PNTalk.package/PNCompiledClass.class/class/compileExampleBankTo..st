examples
compileExampleBankTo: aRepository
	"The basic example for testing transitions"

| cls |
cls := PNCompiledClass compileClass: '
class Bank is_a BankModel
    object
        place stat((0, 0, 0))
        place cashiers(5`#e)
        place FIFO2()
        place nonename185()
        place period(1)
        trans update_stat
            precond nonename185( arrival ), stat( (oldCustOut, oldTotalTime, oldMaxTime) )
            action {
		custOut := oldCustOut + 1.
		spent := self time - arrival.
		totalTime := oldTotalTime + spent.
		maxTime := oldMaxTime max: spent.
	    }
            postcond capacity( #e ), stat( (custOut, totalTime, maxTime) )
        place tellers(5`#e)
        trans service2
            precond FIFO2( arrival ), cashiers( #e )
            action {
		self hold: ((Normal mean: 8 deviation: 2) next).
	    }
            postcond cashiers( #e ), nonename185( arrival )
        trans service
            precond FIFO( arrival ), tellers( #e )
            action {
		self hold: ((Normal mean: 6 deviation: 1) next).
	    }
            postcond FIFO2( arrival ), tellers( #e )

        place p3()
        place p4()
        place p5(#e)
        place cashiers(5`#e)
        trans inner
            cond clerks( maxClerks ), period( period )
            precond clerks12( (old1,old2) ), p5( #e )
            guard {
		period <= 3
	    }
            action {
		result := self innerSimulationForPeriod: period maxClerks: maxClerks.
		cl1 := self consultManager: result.
		cl2 := maxClerks - cl1.
		move1 := (old1 - cl1) max: 0.
		move2 := (old2 - cl2) max: 0.
	    }
            postcond clerks12( (cl1,cl2) ), move2( move1`#e ), move1( move2`#e ), p3( period )
        trans simulate
            precond p3( period )
            action {
		self hold: (#(120 240 120) at: period).
	    }
            postcond p4( period )
        trans endOfSim
            precond period( period ), stat( (custOut, totalTime, maxTime) )
            guard {
		period > 3
	    }
            action {
		Transcript show: ''Customers: '', 
		  custOut printString; cr;
		  show: ''avg. time: '', 
		  (totalTime/custOut) printString;
		  cr; show: ''max. time: '', 
		  maxTime printString; cr.
	    }
        place move2()
        place move1()
        trans move1to2
            precond tellers( #e ), move1( #e )
            postcond cashiers( #e )
        trans move2to1
            precond move2( #e ), cashiers( #e )
            postcond tellers( #e )
        place clerks12((5, 5))
        trans nextPeriod
            precond p4( period ), period( period )
            action {
		nextPeriod := period + 1.
	    }
            postcond p5( #e ), period( nextPeriod )
        place clerks(10)

    method innerSimulationForPeriod: p maxClerks: c
        trans suspendTime
            precond c( c )
            action {
		self suspendTime.
	    }
            postcond p11( c ), p15( c )
        trans finish
            cond p14( results ), p14size( size )
            precond p15( c )
            guard {size = c}
            action {self activateTime.}
            postcond return( results )
        trans makeExperiment
            cond p ( p )
            precond p12( (c,b) )
            action {result := b makeExperimentForPeriod: p clerks: c.}
            postcond p13( (c,result) )
        place p12()
        place p ()
        place p13()
        place p11()

	place p14size(0)
	  place p14init(#e)
	  trans t14init
		precond p14init(#e)
		action { result := OrderedCollection new. }
		postcond p14(result)
        place p14()

        place p15()
        place return()
        place c()
        trans finishExperiment
            precond p13( (c,result) ), p14( oldResults ), p14size( oldSize )
            action {
			results := oldResults add: (Array with: c with: result).
			size := oldSize + 1.
		}
            postcond p14( oldResults ), p14size( size )
        trans nestedExperiment
            precond p11( c )
            guard {c > 0}
            action {
		b := BankModel newIn: (PNtalkWorld new).
		cc := c - 1.
	    }
            postcond p12( (c,b) ), p11( cc )

    method consultManager: result
        place result()
        place return()
        trans consult
            precond result( result )
            action {
		self suspendTime.
		tellers := BankGUI consultResult: result.
		self activateTime.
	    }
            postcond return( tellers )
'.

aRepository addComponent: cls named: (cls name).
