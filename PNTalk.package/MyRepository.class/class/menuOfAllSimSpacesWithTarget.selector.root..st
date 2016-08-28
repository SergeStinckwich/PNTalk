as yet unclassified
menuOfAllSimSpacesWithTarget: aTarget selector: aSelector root: anObject

  | aMenu item obj |

  aMenu:=MenuMorph new.
  item:=anObject.
  (item isKindOf:AtomicDEVS) ifTrue:
  [
	aMenu add: (item name) target: aTarget selector: aSelector argumentList: (Array with: item).
	^aMenu.
  ].
  (anObject isKindOf: DEVSRootSolver) ifTrue: [item:=anObject rootDEVS].
  (item componentNames isEmpty) 
  ifTrue: 
  [aMenu add: 'empty...' target: aTarget selector: #yourself argumentList: #().].
  item componentNames do:
  [
	:cn |
	obj:=item componentNamed: cn.
	(obj isKindOf:AtomicDEVS) 
	ifTrue:
  	[
		aMenu add: (obj name) target: aTarget selector: aSelector argumentList: (Array with: obj).
  	]
	ifFalse:
	[
		| subMenu |
		(obj isKindOf: DEVSRootSolver) ifTrue: [obj:=obj rootDEVS].
		subMenu:=self menuOfAllSimSpacesWithTarget: aTarget selector: aSelector root: obj.
		aMenu add: (obj name asString) subMenu: subMenu target: aTarget selector: aSelector argumentList: (Array with: obj).
	].
  ].
  ^aMenu.