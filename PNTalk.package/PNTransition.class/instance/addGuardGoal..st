accessing
addGuardGoal: aGoal
	""
	aGoal position: (guardGoals size + 1).
	aGoal parent: self.
	guardGoals addLast: aGoal.
