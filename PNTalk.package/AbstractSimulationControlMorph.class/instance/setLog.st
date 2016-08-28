buttons  in window alternatice
setLog
	| logMenu |
	logMenu:=MenuMorph new.
	logMenu add: ' - ' target: self selector: #setReportStream: argument: (DummyStream on: nil).
	logMenu add: 'Transcript' target: self selector: #setReportStream: argument: Transcript.
	logMenu add: 'File' target: self selector: #setReportStreamToFile.
	logMenu popUpInWorld
