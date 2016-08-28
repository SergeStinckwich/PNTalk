as yet unclassified
register

	(TheWorldMenu respondsTo: #registerOpenCommand:) ifTrue: [
		TheWorldMenu unregisterOpenCommand: 'SimSpace Explorer'.
		TheWorldMenu unregisterOpenCommand: 'MyRepository Browser'.
		TheWorldMenu registerOpenCommand: {'MyRepository Browser'. {self. #openBrowser}}].
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self.
