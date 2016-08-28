printing
printString

	^ '{aThread(', id printString, '): ', (superComponent name), '; variables: ', variables printString, '}'.