tools
systemWarning: aString
	| menu | 
	menu := MenuMorph entitled: aString.
	menu add: 'OK' target: menu action: #delete.
	menu openInWorld.
