accessing
addArcGoal: aGoal
	""
	aGoal position: (arcGoals size + 1).
	aGoal parent: self.
	arcGoals addLast: aGoal.
