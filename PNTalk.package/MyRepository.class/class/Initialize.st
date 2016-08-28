as yet unclassified
Initialize
	"MyRepository Initialize"

	Root isNil ifFalse: [ 
		(UIManager default confirm: 'Going to delete whole MyRepository hierrachy !' orCancel: [^'Nevermind'])
			ifFalse: [ ^self ]]. 

	Root := MyRepository new. Root name: 'Root'.

	Root addComponents: { 
		'Documents' -> MyRepository new. 
		'DEVSTraitsAndPrototypes' -> MyRepository new. 
		'Simulations' -> MyRepository new. 
		'TMP' -> MyRepository new }.
	ClipboardObject := nil.

	self register

