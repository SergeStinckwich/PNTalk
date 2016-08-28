stat
printStatFrom: t1 to: t2

	| w str |
	w := self statFrom: t1 to: t2.
	str := 'Avg Time: ', (self avgTime: w) printString, String cr, 
		'Max Time: ', (self maxTime: w) printString, String cr,
		'No Waiting: ', (self noWaiting: w) printString, String cr,
		'Avg Size: ', (self avgSize: w) printString, String cr,
		'Max Size:', (self maxSize: w) printString, String cr.
	^ str.