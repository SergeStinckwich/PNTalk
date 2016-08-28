repository
getMenu
  | myMenu |
  myMenu:=MenuMorph new.
  myMenu add: 'inspect' target: self selector: #inspect.
  myMenu add: 'explore' target: self selector: #explore.
  ^myMenu