as yet unclassified
asHtml

	"very simple demo (only <b> and <i>), somebody could finish the idea"

	| outData p emphasis stopemphasis endDocument beginDocument beginBold endBold beginItalics endItalics htmlEntities temp |

	htmlEntities := (Dictionary new)
		at: 'amp'	put: $&;
		at: 'lt'		put: $<;
		at: 'gt'		put: $>;
		at: 'quot'	put: $";
		at: 'euro'	put: Character euro;
		yourself.

	beginDocument := '<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-2"> 
<title>', self name, '</title>
<body>'.
	endDocument := '</body>'.
	beginBold := '<b>'.
	endBold := '</b>'.
	beginItalics := '<i>'.
	endItalics := '</i>'.

	outData := WriteStream on: String new.
	p:=1.
	outData nextPutAll: beginDocument.
	text runs runsAndValuesDo: [ :rrr :att |
	 	emphasis := String new.
		stopemphasis := String new.
	  	att  do: [ :atribut |
			(atribut isKindOf: TextEmphasis) ifTrue: [
				( (atribut emphasisCode \\ 2) = 1 ) ifTrue:
				      [ emphasis := emphasis, beginBold. stopemphasis := endBold, stopemphasis ].
			 	( ((atribut emphasisCode \\ 4) // 2) = 1 ) ifTrue:
				 	[ emphasis := emphasis, beginItalics. stopemphasis := endItalics, stopemphasis ].
			].
		].
		outData nextPutAll: emphasis.

		temp := text asString copyFrom: p to: (p+rrr-1).

		htmlEntities keysAndValuesDo: [:entity :char |
			char = $& ifFalse: [temp := temp copyReplaceAll: char asString with: '&' , entity , ';']].
		temp := temp copyReplaceAll: '	' with: '	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '.

		temp linesDo: [ :line |
			outData nextPutAll: line.
			outData nextPutAll: '<br>', String cr.
		].
	    	outData nextPutAll: stopemphasis.
		p:= p+ rrr.
	].
	outData nextPutAll: endDocument.

	^ outData contents

