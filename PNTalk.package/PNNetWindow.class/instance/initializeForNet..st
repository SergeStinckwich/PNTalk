initialize-release
initializeForNet: aNet

	sw:=SystemWindow labelled: ('Net: ', aNet name).
 	sp:=ScrollPane new.
 	gr := PNNetUI on: aNet.
	"gr setSubmorphPositionsBy: positions."
	
 	aNet addDependent: gr.
	
"	sp scroller addMorph: gr."
	sp := gr.
" 
 ((self rootSolver) isNil) ifFalse: 
  [
	sw addMorph: sp frame: (0@0 corner: 1@0.93).
	sbm:=StatusBarMorph withModel: self.
	sbm clipSubmorphs: true.
	sw addMorph: sbm frame: (0@0.93 corner: 1@1).
  ]
  ifTrue:
  [
	sw addMorph: sp frame: (0@0 corner: 1@1).
  ]."
	sw addMorph: sp frame: (0@0 corner: 1@1).
	sw paneColor: (Color lightGray).
"	sw openInWorld."




"
	super initialize.
	self setLabel: 'Net: ', aNet name;
		 model: aNet.
""	self
		addMorph: self createToolbar
		frame: (0 @ 0 corner: 1 @ 0.1).
""
	self
		addMorph: self createNetUI
		frame: (0 @ 0.1 corner: 1 @ 1)
"