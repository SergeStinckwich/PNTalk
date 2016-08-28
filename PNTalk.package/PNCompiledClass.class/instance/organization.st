browser
organization

	| list org |
	list := OrderedCollection new.

	org := ClassOrganizer defaultList: (list asArray).
	org addCategory: 'object net'.
	org classify: (objectNet name) under: 'object net'.
	org addCategory: 'methods'.
	netsList do: [:net |
		org classify: (net name) under: 'methods'.
	].
	^ org.