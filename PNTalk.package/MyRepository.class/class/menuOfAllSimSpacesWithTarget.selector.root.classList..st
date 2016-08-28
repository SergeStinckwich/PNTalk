as yet unclassified
menuOfAllSimSpacesWithTarget: aTarget selector: aSelector root: anObject classList: aClass

  | aMenu item obj subMenu |

  aMenu:=MenuMorph new.
  item:=anObject.
  (item isKindOf: aClass)
  ifTrue:
  [
	aMenu add: (item name asString) target: aTarget selector: aSelector argumentList: (Array with: item).
    ^aMenu
  ].
  (item componentNames isEmpty)
  ifTrue: 
  [
	aMenu add: 'empty...' target: aTarget selector: #yourself argumentList: #().
  ]
  ifFalse:
  [
  	item componentNames do:
  	[
		:cn |
		obj:=item componentNamed: cn.
		(obj componentNames isEmpty) ifTrue:
		[
			aMenu add: (obj name asString) target: aTarget selector: aSelector argumentList: (Array with: obj).
		]
		ifFalse:
		[
			subMenu:=self menuOfAllSimSpacesWithTarget: aTarget selector: aSelector root: obj classList: aClass.
			aMenu add: (obj name asString) subMenu: subMenu target: aTarget selector: aSelector argumentList: (Array with: obj).
		].
	].
  ].
  ^aMenu.