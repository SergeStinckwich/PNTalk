as yet unclassified
open

	| window editor |
	window := SystemWindow labelled: name asString.
	window model: self.
	editor := PluggableTextMorph on: self text: #sourceCode accept: #compile: readSelection: nil menu: #editorMenu:shifted:.
	window addMorph: editor frame: (0@0 extent: 1@1).
	"window submorphsDo: [:m | m color: Color lightMagenta]."
	window openInWorldExtent: 400@200.
	
