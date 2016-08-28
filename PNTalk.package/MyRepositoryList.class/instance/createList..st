as yet unclassified
createList: anObject

  | list |

  rootObject:=anObject.
  list:=MyRepositoryListMorph
		on: self
		list: #getList
		selected: #getCurrentSelection
		changeSelected: #noteNewSelection:
		menu: #genericMenu:
		keystroke: nil.
  list doubleClickSelector: #defaultAction.
  lm:=list.
  (MyRepository root) addDependent: self.
  ^list.