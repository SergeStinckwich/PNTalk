Signalized in #eq:. Usefull for debugging:

	[anObject eq: anotherObject] on: NonEqDetected do: [:e | self halt. e resume ] 

