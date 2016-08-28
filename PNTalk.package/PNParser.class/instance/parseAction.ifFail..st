smalltalk parsing
parseAction: sourceStream ifFail: aBlock 
    "   parse: sourceStream class: class noPattern: noPattern context: ctxt notifying: req ifFail: aBlock "
        "Answer a MethodNode for the argument, sourceStream, that is the root of 
        a parse tree. Parsing is done with respect to the argument, class, to find 
        instance, class, and pool variables; and with respect to the argument, 
        ctxt, to find temporary variables. Errors in parsing are reported to the 
        argument, req, if not nil; otherwise aBlock is evaluated. The argument 
        noPattern is a Boolean that is true if the the sourceStream does not 
        contain a method header (i.e., for DoIts)."

         | methNode repeatNeeded myStream s p class noPattern ctxt req |

 	">>> zmena"	
		class := self class.
		noPattern := false.
		ctxt := nil.
		req := nil.
	"<<<"
		
        myStream := sourceStream.
        [repeatNeeded := false.
	   p := myStream position.
	   s := myStream upToEnd.
	   myStream position: p.
	
	"For Pharo"
	self encoder init: class context: ctxt notifying: self.
	
        self init: myStream notifying: req failBlock: [^ aBlock value].
        doitFlag := noPattern.
        failBlock:= aBlock.
"
	 [methNode := self
					method: noPattern
					context: ctxt] 
		on: ReparseAfterSourceEditing 
		do:	[ :ex |
			repeatNeeded := true.
			myStream := requestor text string readStream].
"
	methNode := self
					method: noPattern
					context: ctxt.
					
	 repeatNeeded] whileTrue:
		[encoder := self encoder class new].

"      Squeak version
        [methNode := self method: noPattern context: ctxt
                                encoder: (Encoder new init: class context: ctxt notifying: self)] 
                on: ParserRemovedUnusedTemps 
                do: 
                        [ :ex | repeatNeeded := (requestor isKindOf: TextMorphEditor) not.
                        myStream := ReadStream on: requestor text string.
                        ex resume].
        repeatNeeded] whileTrue.
        encoder := failBlock := requestor := parseNode := nil." "break cycles & mitigate refct overflow"

">>>
	   methNode sourceText: s.
<<<"
        ^ methNode