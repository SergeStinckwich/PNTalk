menu actions
newSimulation

  | str cd aSymbol |

  str:=UIManager default request: 'new simulation name'.
  str~='' & str notNil ifTrue:
  [
	aSymbol:=self assureComponentName: (str asSymbol).
	aSymbol ifNotNil:
	[
	  	cd:=CoupledDEVSPrototype new.
	  	cd name: aSymbol.
	  	self addComponents: { aSymbol -> (cd getSimulatorRT deepVerbose: false; reportStream: (DummyStream on: nil); yourself)}.
	].
  ].

