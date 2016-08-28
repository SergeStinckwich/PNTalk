initialize-release
on: aClass

	class := aClass.
	model := aClass objectNet.
	model addDependent: self.
	self draw.