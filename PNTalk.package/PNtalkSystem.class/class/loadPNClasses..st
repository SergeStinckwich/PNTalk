packaging
loadPNClasses: aFileName

	| file string obj |
	file := FileStream fileNamed: aFileName.
	string := file contentsOfEntireFile. 
	file close.
	obj := Object readFrom: string.
	MyRepository root addComponent: obj named: obj name.
