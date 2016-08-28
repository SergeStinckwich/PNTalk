menu
addSubMenuUpdating: wordingSelector enablementSelector: enablementSelector target: target subMenu: aMenuMorph

	| item |
	item := UpdatingMenuItemMorph new
		target: target;
		subMenu: aMenuMorph;
		wordingProvider: target wordingSelector: wordingSelector;
		enablementSelector: enablementSelector.
	self addMorphBack: item.
	^ item
