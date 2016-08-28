buttons  in window alternatice
openWindowOn: aSimulation
	"Experimental alternative to SimControlMorph. Not finished yet. Probably will be replaced by next version of SimControlMorph because it is better to separate model and gui."

	| win buttons b time buttons2 |

	model := aSimulation.

	win := SystemWindow labelled: model name asString.
	win model: model.

	buttons := AlignmentMorph new.

	b := PluggableButtonMorph on: self getState: nil action: #start.
	b label: 'Start/Continue'.
	b color: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons addMorphBack: b.

	b := PluggableButtonMorph on: self getState: nil action: #stop.
	b label: 'Stop'.
	b color: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons addMorphBack: b.

	b := PluggableButtonMorph on: self getState: nil action: #reset.
	b label: 'Reset'.
	b color: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons addMorphBack: b.

	b := PluggableButtonMorph on: self getState: nil action: #setRTFactor label: #rtFactorWording.
	b onColor: Color transparent offColor: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons addMorphBack: b.

	b := PluggableButtonMorph on: self getState: nil action: #setStopTime label: #stopTimeWording.
	b onColor: Color transparent offColor: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons addMorphBack: b.

	buttons2 := AlignmentMorph new.

	b := PluggableButtonMorph on: self getState: nil action: #openModel.
	b label: 'Model'.
	b color: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons2 addMorph: b.

	b := PluggableButtonMorph on: self getState: nil action: #setLog label: #logWording.
	b onColor: Color transparent offColor: Color transparent.
	b feedbackColor: Color black.
	b setProperty: #cornerStyle toValue: #rounded.
	buttons2 addMorph: b.

	self changed: #rtFactorWording.
	self changed: #StopTimeWording.

	time := SimTimeMorph withModel: (model rootDEVS).
	time extent: 100@10.
	time updateOnce.
	buttons2 addMorph: time.

	win addMorph: buttons frame: (0@0 extent: 1@0.5).
	win addMorph: buttons2 frame: (0@0.5 extent: 1@0.5).
	win openInWorldExtent: 350@50.
