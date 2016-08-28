examples
compileConferenceTo: aRepository
	"The basic example for testing transitions"
| conf author rev cls |
conf := '
class Conference is_a PN
	object
		place dates()
		place stage()
		place phase(1)
		place t1(#e)
		place t2()
		
		place authors()
		place reviewers()
		
		trans initialize
			precond t1(#e)
			action { a := Array with: ''2005-11-24T19:35:00'' with: ''2005-11-24T19:36:00'' with: ''2005-11-24T19:37:00''.}
			postcond dates(a), stage(1)
		
		sync phase: p
			cond phase(p)
		sync reviewer: r
			cond reviewers(r)
		sync author: a
			cond authors(a)
			
	method addAuthorNamed: n
		place n()
		place return()
		trans t
			precond n(n)
			action { a := Author new. a conf: self; setName: n. }
			postcond authors(a), return(a)

	method addReviewerNamed: n
		place n()
		place return()
		trans t
			precond n(n)
			action { a := Reviewer new. a conf: self; setName: n. }
			postcond reviewers(a), return(a)
'.
"
		trans waitForNextStage
			cond dates(d)
			precond stage(i)
			guard { i < 4 }
			action { self holdTill: (d at: i). ii := i + 1. }
			postcond t2(ii), stage(ii)

		trans nextStage
			precond t2(i), phase(old)
			action { Transcript show: 'next phase .... ' }
			postcond phase(i)	
"

author := '				
class Author is_a PN
	object
		place name()
		place conference()
		place paper(nil)
		place review(nil)
		
		sync name: n
			cond name(n)
		sync paper: p
			cond paper(p)
		sync review: r
			cond review(r)
		
		sync putPaper: p
			cond conference(c)
			precond paper(old)
			guard { c phase: 1 }
			postcond paper(p)
		sync putReview: r
			cond conference(c)
			precond review(old)
			guard { c phase: 2 }
			postcond review(r)
			
	method setName: n
		place n()
		place return()
		trans t
			precond n(n)
			postcond name(n), return(n)

	method conf: c
		place c()
		place return()
		trans t
			precond c(c)
			postcond conference(c), return(c)
'.
rev := '
class Reviewer is_a PN
	object
		place name()
		place conference()
		place author()
		
		sync name: n
			cond name(n)
		sync downloadPaper: p byAuthor: a
			cond conference(c)
			guard { (c phase: 2) & (c author: a) & (a review: nil) & (a paper: p) }
			postcond author(a)
		sync uploadReview: r ofPaperByAuthor: a
			cond conference(c), author(a)
			guard { (c phase: 2) & (a putReview: r) }
		sync downloadedAuthor: a
			cond author(a)
			
	method setName: n
		place n()
		place return()
		trans t
			precond n(n)
			postcond name(n), return(n)

	method conf: c
		place c()
		place return()
		trans t
			precond c(c)
			postcond conference(c), return(c)

'.

cls := PNCompiledClass compileClass: conf.
aRepository addComponent: cls named: (cls name).
cls := PNCompiledClass compileClass: author.
aRepository addComponent: cls named: (cls name).
cls := PNCompiledClass compileClass: rev.
aRepository addComponent: cls named: (cls name).
