copying
shallowCopy
	
	| o |

	o := super shallowCopy.

	o time: self time.
	o activity: activity.

	o instVarNamed: 'calendar' put: calendar.
	o instVarNamed: 'timeSuspend' put: timeSuspend.
	o instVarNamed: 'changedTime' put: changedTime.
	o instVarNamed: 'clockCounter' put: clockCounter.

	^ o.