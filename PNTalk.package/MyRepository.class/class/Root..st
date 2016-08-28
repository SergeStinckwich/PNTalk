as yet unclassified
Root: obj

	(UIManager default confirm: 'Going to replace whole MyRepository hierrachy !' orCancel: [^'Nevermind'])
			ifFalse: [ ^self ]. 
	Root become: obj.
	(MyRepository root) changed: #hierarchicalList.
