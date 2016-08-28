accessing
sourceCode

	| src tabs i queue tab tokens |
	tab := String tab.
	tabs := tab, tab.
"	src := String tab, 'sync ', name, String cr."
	
	src := String tab, 'inhibitor '.
	(name includesSubString: ':')
		ifTrue: [
			tokens := name findBetweenSubStrs: ':'.
			formalParams do: [ :param | src := src, tokens removeFirst, ': ', param, ' '].
		]
		ifFalse: [
			src := src, name.
		].
	src := src, String cr. 	
	
	condsList isEmpty ifFalse: [
		src := src, tabs, 'cond '.
		i := condsList size - 1.
		1 to: i do: [ :ii | src := src, (condsList at: ii) sourceCode, ', ' ].
		src := src, (condsList at: (condsList size)) sourceCode.
		src := src, String cr.
	].
	precondsList isEmpty ifFalse: [
		src := src, tabs, 'precond '.
		i := precondsList size - 1.
		1 to: i do: [ :ii | src := src, (precondsList at: ii) sourceCode, ', ' ].
		src := src, (precondsList at: (precondsList size)) sourceCode.
		src := src, String cr.
	].
	guardsList isEmpty ifFalse: [
		src := src, tabs, 'guard { '.
		queue := OrderedCollection new.
		guardsList do: [ :guard | src := src, (guard sourceCode: queue)].
		src := src, ' }', String cr.
	].
	actionsList isEmpty ifFalse: [
		src := src, tabs, 'action {', String cr, tabs, tab.
		queue := OrderedCollection new.
		actionsList do: [ :action | src := src, (action sourceCode: queue)].
		src := src,' }', String cr.
	].
	postcondsList isEmpty ifFalse: [
		src := src, tabs, 'postcond '.
		i := postcondsList size - 1.
		1 to: i do: [ :ii | src := src, (postcondsList at: ii) sourceCode, ', ' ].
		src := src, (postcondsList at: (postcondsList size)) sourceCode.
		src := src, String cr.
	].	^ src.