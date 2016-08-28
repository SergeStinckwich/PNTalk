initialize-release
initializeForClass: aClass

	sw:=SystemWindow labelled: ('Class: ', aClass name).
 	sp:=ScrollPane new.
 	gr := PNClassUI on: aClass.
	"gr setSubmorphPositionsBy: positions."
	
 	aClass addDependent: gr.
	
"	sp scroller addMorph: gr."
	sp := gr.

	sw addMorph: sp frame: (0@0 corner: 1@1).
	sw paneColor: (Color lightGray).


"
	super initialize.
	self setLabel: 'Class: ', aClass name;
		 model: aClass.
	self
		addMorph: self createClassUI
		frame: (0 @ 0.1 corner: 1 @ 1)
"