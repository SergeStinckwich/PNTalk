smalltalk parsing
OLDparseAction: sourceStream ifFail: aBlock 
    "   parse: sourceStream class: class noPattern: noPattern context: ctxt notifying: req ifFail: aBlock "
	   "Answer a MethodNode for the argument, sourceStream, that is the root of 
        a parse tree. Parsing is done with respect to the argument, class, to find 
        instance, class, and pool variables; and with respect to the argument, 
        ctxt, to find temporary variables. Errors in parsing are reported to the 
        argument, req, if not nil; otherwise aBlock is evaluated. The argument 
        noPattern is a Boolean that is true if the the sourceStream does not 
        contain a method header (i.e., for DoIts)."
"
         | methNode repeatNeeded myStream parser s p class noPattern ctxt req |

		class := self class.
		noPattern := false.
		ctxt := nil.
		req := nil.

        (req notNil and: [RequestAlternateSyntaxSetting signal and: [(sourceStream isKindOf: FileStream) not]])
                ifTrue: [parser := self as: DialectParser]
                ifFalse: [parser := self].
        myStream := sourceStream.
        [repeatNeeded := false.
	   p := myStream position.
	   s := myStream upToEnd.
	   myStream position: p.
        parser init: myStream notifying: req failBlock: [^ aBlock value].
        doitFlag := noPattern.
        failBlock:= aBlock.
        [methNode := parser action: noPattern context: ctxt
                                encoder: (Encoder new init: class context: ctxt notifying: parser)] 
                on: ParserRemovedUnusedTemps 
                do: 
                        [ :ex | repeatNeeded := (requestor isKindOf: TextMorphEditor) not.
                        myStream := ReadStream on: requestor text string.
                        ex resume].
        repeatNeeded] whileTrue.
        encoder := failBlock := requestor := parseNode := nil. ""break cycles & mitigate refct overflow""
""
	   methNode sourceText: s.
""
        ^ methNode
"