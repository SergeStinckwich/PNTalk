as yet unclassified
changeExpression: expr

	| src newArc t myTrans |
	t := arc type asString.
	src := t, ' ', from name, '(', expr, ')'.
	"pomocny prechod, jen pro kompilaci, dale se nebude pouzivat"
	myTrans := PNCompiledTransition new.
	newArc := PNParser new compileArc: src type: (arc type) to: myTrans.
	arc arc: newArc arc.
